/**
 * Created by Thad-PC-2019 on 7/6/2020.
 */

public static void addPricebookEntries() {

    List<Pricebook2> standardPricebook = [
            SELECT Id, Name
            FROM Pricebook2
            WHERE Name = 'Standard Price Book' AND IsStandard = TRUE
    ];

    if (standardPricebook.size() > 0) {

        standardPricebook[0].IsActive = true;
        upsert standardPricebook;

        List<Product2> allProducts = [
                SELECT Id
                FROM Product2
        ];

        List<PricebookEntry> allPricebookEntries = new List<PricebookEntry>();
        List<Decimal> samplePrices = new List<Decimal>();
        samplePrices.add(249.00);
        samplePrices.add(2495.00);
        samplePrices.add(25.00);
        samplePrices.add(0.00);
        samplePrices.add(50.00);
        samplePrices.add(325.00);
        Integer priceCount = 0;
        for (Product2 prod : allProducts) {
            PricebookEntry enterProduct = new PricebookEntry();
            enterProduct.IsActive = true;
            enterProduct.Pricebook2Id = standardPricebook[0].Id;
            enterProduct.Product2Id = prod.Id;
            enterProduct.UnitPrice = samplePrices[priceCount];
            enterProduct.UseStandardPrice = false;
            priceCount++;
            if (priceCount >= samplePrices.size()) {
                priceCount = 0;
            }
            allPricebookEntries.add(enterProduct);
        }
        if (allPricebookEntries.size() > 0) {
            upsert allPricebookEntries;
        }
    }

}

public static void setGuestPermissionSet() {
    String siteName = 'CAPE';

    List<Site> site = [
            SELECT GuestUserId
            FROM Site
            WHERE Name = :siteName
    ];

    if (site.size() > 0 ) {

        //Add Permission set to all Admins
        List<PermissionSet> eventPermissionSets = [SELECT Name, Id FROM PermissionSet WHERE Name = 'CAPE_Guest_User'];

        List<PermissionSetAssignment> permissionSetList = new List<PermissionSetAssignment>();
        if (!eventPermissionSets.isEmpty()) {
            permissionSetList.add(new PermissionSetAssignment(PermissionSetId = eventPermissionSets[0].Id, AssigneeId = site[0].GuestUserId));
        }
        if (!permissionSetList.isEmpty()) {
            upsert permissionSetList;
        }
    }

}