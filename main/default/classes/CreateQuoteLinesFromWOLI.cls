/** CreateQuoteLinesFromWOLI
 * 
 * @author Shoby Abdi, Program Lead, B2B Solution Architect Program
 * 
 * Invokable Action for a Flow. Available as an Apex Action and should typically be used
 * in an Loop to generate a Collection of Quote Line Items. 
 * 
 * Input: Quote Id, Work Order Line Item Record
 * Output: Quote Line Item Record
 * 
 * Purpose of this Class is to Create Quote Line Items from Work Order Line Items.  
 * This class maybe used to create Work Order Lien Items from records that may require
 * more complex needs around creating quote line item records that require complex logic. 
 * Keep in mind as well that Revenue Cloud/CPQ has complex logic hidden in a managed package
 * that may require mappings that are not easily done in a Flow. This is to accomodate those 
 * needs. It also makes the assumption Pricebook Entries may or may not be present on Work Order
 * Line Items as those mappings are not typically required. Then the Standard Pricebook
 * is queried and, if a Product is available, that mapping is brought in. 
 * 
*/
global class CreateQuoteLinesFromWOLI {
    @InvocableMethod(label='Create Quote Lines' description='Iterate over work line items from a work order and instantiate quote lines')
    global static List<SBQQ__QuoteLine__c> createQuoteLines(List<QuoteFlowInput> woliRecords) {
        String pricebookId = [select Id from Pricebook2 where isStandard = true limit 1].Id;
        
        List<SBQQ__QuoteLine__c> createLines = new List<SBQQ__QuoteLine__c>();
        String quoteId = woliRecords[0].quoteId;
        SBQQ__QuoteLine__c newQuoteLine = new SBQQ__QuoteLine__c();
        newQuoteLine.SBQQ__Quote__c = quoteId;
        newQuoteLine.SBQQ__RenewedAsset__c = woliRecords[0].woliRecord.AssetId;
        newQuoteLine.SBQQ__Quantity__c = woliRecords[0].woliRecord.Quantity;
        newQuoteLine.SBQQ__Product__c = woliRecords[0].woliRecord.Product2Id;
        if(woliRecords[0].woliRecord.PricebookEntryId != null) {
            newQuoteLine.SBQQ__PricebookEntryId__c = woliRecords[0].woliRecord.PricebookEntryId;
        } else if(woliRecords[0].woliRecord.Product2Id != null) {
            newQuoteLine.SBQQ__PricebookEntryId__c = [select Id from PricebookEntry where Pricebook2Id =: pricebookId 
                and Product2Id = : woliRecords[0].woliRecord.Product2Id].Id;
        } else {
            newQuoteLine.SBQQ__PricebookEntryId__c = null;
        }
        createLines.add(newQuoteLine);
        return createLines;
    }

    global class QuoteFlowInput {
        @InvocableVariable
        global String quoteId;

        @InvocableVariable
        global WorkOrderLineItem woliRecord;
    }

}