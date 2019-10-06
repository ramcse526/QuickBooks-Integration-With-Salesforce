@isTest
public class QB_ConnectionEstablishCtrlTest {
    @isTest static void testConnectToQuickbooks() {
        PageReference pageRef = QB_ConnectionEstablishCtrl.connectToQuickbooks();
        String baseUrl = 'https://appcenter.intuit.com/connect/oauth2';
        System.assert(pageRef.getUrl().startsWith(baseUrl));
    }
}