/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Damia Nizam
 */
import com.paypal.core.PayPalEnvironment;
import com.paypal.core.PayPalHttpClient;
import com.paypal.http.HttpResponse;
import com.paypal.orders.*;

import java.io.IOException;
import java.util.ArrayList;

public class PayPalService {

    private final String clientId;
    private final String secret;
    private final PayPalEnvironment environment;
    private final PayPalHttpClient client;

    public PayPalService(String clientId, String secret) {
        this.clientId = clientId;
        this.secret = secret;
        this.environment = new PayPalEnvironment.Sandbox(clientId, secret);
        this.client = new PayPalHttpClient(environment);
    }

    public String createPaymentOrder(double amount, String currencyCode) {
        OrdersCreateRequest request = new OrdersCreateRequest();
        request.requestBody(new OrderRequest()
                .checkoutPaymentIntent("CAPTURE")
                .purchaseUnits(new ArrayList<PurchaseUnitRequest>() {{
                    PurchaseUnitRequest purchaseUnitRequest = new PurchaseUnitRequest();
                    purchaseUnitRequest.amountWithBreakdown(new AmountWithBreakdown()
                            .currencyCode(currencyCode)
                            .value(String.format("%.2f", amount)));
                    add(purchaseUnitRequest);
                }}));

        try {
            HttpResponse<Order> response = client.execute(request);
            if (response.statusCode() == 201) {
                Order order = response.result();
                return order.id();
            } else {
                // Handle error response from PayPal
                // (response.statusCode(), response.result())
                return null;
            }
        } catch (IOException e) {
            // Handle exception
            return null;
        }
    }

    // Other methods to handle capturing payment, refunds, etc.
}
