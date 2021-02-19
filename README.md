# Codebase for a B2B Solution Architect Learning Lab 

## B2B Solution Architect Info

Engage in the B2B Solution Architect Curriculum in Partner Learning Camp today: sfdc.co/B2BSolutionArchitectCurriculum-PLC.
![Image](https://lh5.googleusercontent.com/ryddi_vuksjougLsRsh8zS8N-ILHEeEAU6W3gW50HxmhmDShTjRzMJQM335FEeKTTHghz-8NCSSZtlbu8KpxpBY95TNMGNqlcdGhdRmHJyRWISZQn28lf4MIrr2KnQ2Sig9XPNsP)

## Repo Inventory
* CreateAssetsFromQuote.flow - The purpose of this Flow is to create Assets from Products defined on a Closed Quote. A key driver for this Flow is that once Products are sold they need to be tracked within the Service and Renewal lifecycle as well. Generating Products as Assets allows for multiple use cases around Asset Lifecycle Management to be engaged on. For more on the applicability of this Flow check out the Asset Lifecycle Management on the B2B Solution Architect Curriculum in either PLC or ACT.
* CreateMaintenancePlansAndContracts.flow - In this flow we will not be creating Service Contract Line Items. Why is because the Products specified on your Quote may not constitute “Service” level support but all those products would be within the purview of a Maintenance Plan. If you *do* want to create Service Contracts from Assets there is the added wrinkle of Pricebook Entries. Pricebook Entries are not assigned to Assets but Service Contract Line Items also require Pricebook Entries. 
* CreateQuoteFromWorkOrder.flow - The purpose of this Flow is to Create Quote and Opportunity records from the Work Order this Screen Flow is associated with. the key driver behind this Flow is a particular Work Order could be selected for Renewal so a Renewal Quote And Opportunity are created with necessary Quote Line Items and Opportunity Line Items. Sales Teams can, from here, now modify the Quote and Opportunity within the terms of the Sales Process. 
* CreateWOLIFromQuote.flow - The purpose of this Flow is to create Work Order Line Items from a Selected Quote associated the Quote this Screen Flow is on. In other flows we created a Work Order without any Work Order Line Items. The key driver of this flow is to select an existing Work Order that is associated to this Quotes Account Record and convert the Quote Line Items to the Work Order Line Items. In order for this flow to work there must be an associated Pricebook to the Work Order. When creating the Work Order Line Items the Product field is READ ONLY, it is populated once the Pricebook Entry is associated. This is why a Pricebook is required on the Work Order.
* CreateServiceApptFromQuote.flow - The purpose of this Flow is to create Work Order and Service Appointment records once a Quote is Accepted and is the Primary and the Opportunity is Won. A key driver for this Flow is once that Quote is accepted the expectations are the Work Orders and Service Appointments are mocked up for the Field Service or Service team to setup the service or installation expectations. 
* UpdateAssetsOnWOCompletion.flow - The purpose of this Flow is to update Assets associated to a Work Order on an Account to Installed once a Work Order is completed. The key driver around this is to setup service contracts and renewal contracts around those Assets.
* CreateQuoteLinesFromWOLI.cls - Invokable Action for a Flow. Available as an Apex Action and should typically be used in an Loop to generate a Collection of Quote Line Items. 
 
## Org Setup

Sign up for a CPQ org

To complete this lab, you need a special Developer Edition org that contains Salesforce CPQ and our sample data. Get the free Developer Edition and connect it to Trailhead now so you can complete the challenges in this module.
Even if you've recently signed up for a special CPQ-enabled Developer Edition org, sign up for new one now. We're always adding new data. Also note that the Salesforce CPQ managed package expires after 90 days, so you may need a new org anyway.

1. Sign up for a free Developer Edition org with Salesforce CPQ (https://developer.salesforce.com/promotions/orgs/cpqtrails).
    1. https://developer.salesforce.com/promotions/orgs/cpqtrails
2. Fill out the form. For Email, enter an active email address. For Username, enter a username that looks like an email address and is unique, but it doesn't need to be a valid email account (for example, yourname@cpq4ever.com).
3. After you fill out the form, click *Sign me up*. A confirmation message appears.
4. When you receive the activation email (this might take a few minutes), open it and click *Verify Account.*
5. Complete your registration by setting your password and challenge question. *Tip*: Write down your username, password, and login URL for easy access later.
6. You are logged in to your Developer Edition.

## Enable Field Service

Before you can start working with Field Service, you must enable it.

1. In your CPQ org , click  then select *Setup*.
2. Enter field service in the Quick Find box, then select *Field Service Settings*.
3. Click the toggle to enable Field Service.

Look at all the shiny new settings! For now, leave those settings alone—you can adjust them all you want after you finish the project.

## Install the FSL Managed Package

Now you’re ready to install the goodness of the Field Service Managed package right into your Trailhead playground. Salesforce regularly releases new versions of the Field Service managed package as part of their standard Spring, Summer, and Winter releases so it will be up-to-date.

1. Open an incognito browser window in Chrome.
2. In the incognito window, paste this link https://fsl.secure.force.com/install into the address bar to install the managed package.
3. Click the link to install the most recent managed package to your Trailhead playground production org. For a business org, you may want to install new packages in a sandbox org first to test them. If you get an error message saying the managed package isn't yet available on your Trailhead playground, please try completing this project again in a few days.
4. On the Salesforce login screen, enter the username and password for your Trailhead Playground, then click *Log In*.
5. Select *Install for Admins Only*, then click *Install*.
6. Approve the request to grant access to third-party websites for geolocation and optimization services.
7. Wait for a message telling you that you’ll be notified by email when the package is installed, and click *Done*. Spend a few minutes doing something fabulous while you’re waiting for the email.


Install the FSL Managed Package: https://trailhead.salesforce.com/content/learn/projects/install-the-field-service-lightning-managed-package

