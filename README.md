# Codebase for the Selling Products to Servicing Assets And Back Again Learning Lab 

The codebase you find here is related to a Learning Lab created by the B2B Solution Architect Program. The codebase is meant for education purposes and is not built for purposes of production.

### Note

You will see a file within the repository called _config.yml. Its purpose is to create the Github Page you see based on the Readme.md. To ignore it within your pulls do the following:
* Add _config.yml to your .gitignore file
* Add **/_config.yml to your .forceignore file

## Learning Lab Videos

Feel free to engage in the Learning Lab or simply take the repo here and work at your own pace. You will find videos related to the lab at our Video hub [here](https://b2bsa.hubs.vidyard.com/). 

## Learning Lab Courses

To fully engage in the Learning Lab or at least understand the context of this codebase we recommend taking the following courses in Partner Learning Camp:
* [Going Seamlessly from Configuration to Installation](https://sfdc.co/PLC-GoingSeamlessly)
* [Tracking Customer Field Service Lifecycle](https://sfdc.co/PLC-CustFieldServiceLifecycle)
* [Multi-Cloud Asset Lifecycle Management](https://sfdc.co/PLC-AssetLifecycle)
* [Proactive Service For Your Products](https://sfdc.co/PLC-ProactiveServiceProducts)


## Repo Inventory
* CreateAssetsFromQuote.flow - The purpose of this Flow is to create Assets from Products defined on a Closed Quote. A key driver for this Flow is that once Products are sold they need to be tracked within the Service and Renewal lifecycle as well. Generating Products as Assets allows for multiple use cases around Asset Lifecycle Management to be engaged on. For more on the applicability of this Flow check out the Asset Lifecycle Management on the B2B Solution Architect Curriculum in either PLC or ACT.
* CreateMaintenancePlansAndContracts.flow - In this flow we will not be creating Service Contract Line Items. Why is because the Products specified on your Quote may not constitute “Service” level support but all those products would be within the purview of a Maintenance Plan. If you *do* want to create Service Contracts from Assets there is the added wrinkle of Pricebook Entries. Pricebook Entries are not assigned to Assets but Service Contract Line Items also require Pricebook Entries. 
* CreateQuoteFromWorkOrder.flow - The purpose of this Flow is to Create Quote and Opportunity records from the Work Order this Screen Flow is associated with. the key driver behind this Flow is a particular Work Order could be selected for Renewal so a Renewal Quote And Opportunity are created with necessary Quote Line Items and Opportunity Line Items. Sales Teams can, from here, now modify the Quote and Opportunity within the terms of the Sales Process. 
* CreateWOLIFromQuote.flow - The purpose of this Flow is to create Work Order Line Items from a Selected Quote associated the Quote this Screen Flow is on. In other flows we created a Work Order without any Work Order Line Items. The key driver of this flow is to select an existing Work Order that is associated to this Quotes Account Record and convert the Quote Line Items to the Work Order Line Items. In order for this flow to work there must be an associated Pricebook to the Work Order. When creating the Work Order Line Items the Product field is READ ONLY, it is populated once the Pricebook Entry is associated. This is why a Pricebook is required on the Work Order.
* CreateServiceApptFromQuote.flow - The purpose of this Flow is to create Work Order and Service Appointment records once a Quote is Accepted and is the Primary and the Opportunity is Won. A key driver for this Flow is once that Quote is accepted the expectations are the Work Orders and Service Appointments are mocked up for the Field Service or Service team to setup the service or installation expectations. 
* CreateWorkOrderAndServiceAppointmentFromAnOrder - The purpose of this Flow is to create Work Order and Service Appointment records once an Order is Activated. A key driver for this Flow is once that Quote is accepted the expectations are the Work Orders and Service Appointments are mocked up for the Field Service or Service team to setup the service or installation expectations.
* UpdateAssetsOnWOCompletion.flow - The purpose of this Flow is to update Assets associated to a Work Order on an Account to Installed once a Work Order is completed. The key driver around this is to setup service contracts and renewal contracts around those Assets.
* CreateQuoteLinesFromWOLI.cls - Invokable Action for a Flow. Available as an Apex Action and should typically be used in an Loop to generate a Collection of Quote Line Items. 
 
## Org Setup

Sign up for a CPQ org

To complete this lab, you need a special Developer Edition org that contains Salesforce CPQ and our sample data. Get the free Developer Edition and connect it to Trailhead now so you can complete the challenges in this module.
Even if you've recently signed up for a special CPQ-enabled Developer Edition org, sign up for new one now. We're always adding new data. Also note that the Salesforce CPQ managed package expires after 90 days, so you may need a new org anyway.

1. Sign up for a free Developer Edition org with Salesforce CPQ [https://developer.salesforce.com/promotions/orgs/cpqtrails](https://developer.salesforce.com/promotions/orgs/cpqtrails).
2. Fill out the form. For Email, enter an active email address. For Username, enter a username that looks like an email address and is unique, but it doesn't need to be a valid email account (for example, yourname@cpq4ever.com).
3. After you fill out the form, click *Sign me up*. A confirmation message appears.
4. When you receive the activation email (this might take a few minutes), open it and click *Verify Account.*
5. Complete your registration by setting your password and challenge question. *Tip*: Write down your username, password, and login URL for easy access later.
6. You are logged in to your Developer Edition.

## Update the CPQ Orgs Package To The Latest Release (Optional)

The version of the “Salesforce CPQ” package that comes with the org above is a few releases old. While not required for the Lab you can also update the package. Here we are looking for the most recent release of the “Salesforce CPQ” managed package. 

1. Open an incognito browser window in Chrome.
2. In the incognito window, paste this link [https://install.steelbrick.com/](https://install.steelbrick.com/) into the address bar to install the managed package.
3. Click the link to install the most recent managed package to your production org. For a business org, you may want to install new packages in a sandbox org first to test them. 
4. On the Salesforce login screen, enter the username and password for your Labs org, then click *Log In*.
5. Select *Install for Admins Only*, then click *Install*.
6. Approve the request to grant access to third-party websites for geolocation and optimization services.
7. Wait for a message telling you that you’ll be notified by email when the package is installed, and click *Done*. 

## Enable Field Service

Before you can start working with Field Service, you must enable it.

1. In your CPQ org , click  then select *Setup*.
2. Enter field service in the Quick Find box, then select *Field Service Settings*.
3. Click the toggle to enable Field Service.
4. If you make changes to the below settings Click Save

Look at all the shiny new settings! For now, leave those settings alone—you can adjust them all you want after you finish the project.

## Install the SFS Managed Package

Now you’re ready to install the goodness of the Field Service Managed package right into your Labs. Salesforce regularly releases new versions of the Field Service managed package as part of their standard Spring, Summer, and Winter releases so it will be up-to-date. Here we are looking for the most recent release of the “Salesforce Field Service” managed package. 

1. Open an incognito browser window in Chrome.
2. In the incognito window, paste this link [https://fsl.secure.force.com/install](https://fsl.secure.force.com/install) into the address bar to install the managed package.
3. Click the link to install the most recent managed package to your production org. For a business org, you may want to install new packages in a sandbox org first to test them. 
4. On the Salesforce login screen, enter the username and password for your Labs org, then click *Log In*.
5. Select *Install for Admins Only*, then click *Install*.
6. Approve the request to grant access to third-party websites for geolocation and optimization services.
7. Wait for a message telling you that you’ll be notified by email when the package is installed, and click *Done*. 


Install the FSL Managed Package: [https://trailhead.salesforce.com/content/learn/projects/install-the-field-service-lightning-managed-package](https://trailhead.salesforce.com/content/learn/projects/install-the-field-service-lightning-managed-package)

## Deploy this Codebase

Thanks to Andrew Fawcett [@andyinthecloud](https://twitter.com/andyinthecloud) we have this incredible single click process to deploy the code in this Github repo to the org you just generated

[https://githubsfdeploy.herokuapp.com/app/githubdeploy/b2bsolutionarchitectprogram/revfsllearninglabv1](https://githubsfdeploy.herokuapp.com/app/githubdeploy/b2bsolutionarchitectprogram/revfsllearninglabv1)

To learn more about githubsfdeploy please check out his Github Repo: [https://github.com/afawcett/githubsfdeploy](https://github.com/afawcett/githubsfdeploy)

While this is the easiest way to deploy you may choose other options. If so we recommend SFDX. 

## Metadata To Add

There are some additions you can make to make it easier to debug the flows
* Add Work Order Related List to Account Page View
* Add Pricebook Field to Work Order Page View
* Add Product field to Work Order Line Item Page View
* Activate Service Contracts within Entitlement Management Settings

## Data Setup
### Products
The existing Product table data within this org will aid our use case around IT installation at a Hotel Conference Room. Product data utilized in the lab will be: Projector, Projector Ceiling Mount, Projector Screen, Smart US Power Strip, Stereo Speakers, 4K Monitor, 4K Video Camera, Camera Mount Microphone, Interior Keypad
### Pricebook
The existing Standard Pricebook will be utilized for this lab. We will modify pricing on a quote basis versus creating net new pricebooks. 
### Accounts
Since this is a brand new Trailhead org we will be utilizing some of the existing Account data within this. 
### Customer Account
This lab will utilize the Grand Hotels & Resorts Ltd account record for lab
### Location Accounts
This will lab will require a Location account record related to the Grand Hotels & Resorts Ltd account record
### Maintenance Plans
A key part of this course will be do we use a Maintenance Plan or not.  Maintenance Plans drive a lot of automation in relation to work orders created around Assets related to a customers Accounts. In this lab we will talk about both utilizing and not utilizing them. For the purposes of this lab, and the automation we will speak of, maintenance plans indicate a passive need for support where we will talk about active efforts of installation, replenishment and contract renewal. [https://help.salesforce.com/articleView?id=sf.fs_create_maintenance.htm&type=5](https://help.salesforce.com/articleView?id=sf.fs_create_maintenance.htm&type=5)
### Field Service Pricing Data Model
A big part of this course is going to be the relationship between CPQ and Field Service. If you’ve set up a product catalog in Salesforce to track the goods and services your business offers, you can associate items in your price books with work orders and their line items, similar to the way you can associate products with opportunities or orders. If you specify a price book on a work order, this allows you to link each work order line item to a price book entry (product) from the price book. List price, discount, and quantity are defined at the line-item level.After a product is purchased and installed for a customer, it is typically tracked as an asset in Salesforce. The Asset lookup field on work orders and work order line items allows you to track work being performed on a specific asset. It also makes it possible to view a history of all work completed on the asset.If an asset is replaced or upgraded, the relationship between the old and new asset is tracked in an asset relationship record. An asset relationship lists a start and end time—for instance, if the replacement asset is being leased—and a relationship type, which must be defined by the admin. [https://developer.salesforce.com/docs/atlas.en-us.field_service_dev.meta/field_service_dev/fsl_dev_soap_pricing.htm](https://developer.salesforce.com/docs/atlas.en-us.field_service_dev.meta/field_service_dev/fsl_dev_soap_pricing.htm)
### Service Contracts
To create Service Contracts then SLAs are required and for that Entitlement Management needs to be enabled within every org
### Locations and Products Consumed in FSL
We will not be creating any Location records as locations within Field Service could be locations that have nothing to do with customer locations. We will assume that all customer locations and addresses are contained within Account records. 
### Orders with Order Products 
We have a flow to create a Work Order and Service Appointment from an Order Record and Quotes will create Orders From standard Quote Functionality. Even then we will not be syncing Quote Line Items to Order Product data for a handful of reasons. First is there is different logic driving dates [https://help.salesforce.com/articleView?id=sf.cpq_order_date_logic.htm&type=5](https://help.salesforce.com/articleView?id=sf.cpq_order_date_logic.htm&type=5). Second is the use of Order records may vary from organization to organization. 

## Service Cloud for Salesforce CPQ (Optional)

Salesforce CPQ’s Service Cloud integration package provides sales contract features to Service Cloud users. When you enable the Service Cloud Integration package, Salesforce CPQ replaces contracts with service contracts and subscriptions with service contract line items.

While we are not using this connector in this lab (it accommodates a lot of complex use cases we will not address in this labs) it can come in handy. This connector utilizes Apex Triggers and Classes and is also Managed where we will be creating Flows. For more on the packages capabilities go here: [https://help.salesforce.com/articleView?id=sf.cpq_service_cloud_parent.htm&type=5](https://help.salesforce.com/articleView?id=sf.cpq_service_cloud_parent.htm&type=5)

The version of the “Service Cloud for Salesforce CPQ” package that comes with the org above is a few releases old. While not required for the Lab you can also update the package.  Here we are looking for the most recent release of the “Service Cloud for Salesforce CPQ” managed package. 

1. Open an incognito browser window in Chrome.
2. In the incognito window, paste this link [https://install.steelbrick.com/](https://install.steelbrick.com/) into the address bar to install the managed package.
3. Click the link to install the most recent managed package to your production org. For a business org, you may want to install new packages in a sandbox org first to test them. 
4. On the Salesforce login screen, enter the username and password for your Labs org, then click *Log In*.
5. Select *Install for Admins Only*, then click *Install*.
6. Approve the request to grant access to third-party websites for geolocation and optimization services.
7. Wait for a message telling you that you’ll be notified by email when the package is installed, and click *Done*. 

