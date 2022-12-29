import { auth } from "@googleapis/calendar";

export class GoogleOauthClientFactory {
    static createFromToken(googleAccessToken: string) {
        const authClient = new auth.OAuth2();
        authClient.setCredentials({access_token: googleAccessToken});

        return authClient;
    }
}