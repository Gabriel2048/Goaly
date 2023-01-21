import {auth} from "@googleapis/calendar";
import {OAuth2Client} from "google-auth-library";

export class GoogleOauthClientFactory {
  static createFromToken(googleAccessToken: string): OAuth2Client {
    const authClient = new auth.OAuth2();
    authClient.setCredentials({access_token: googleAccessToken});

    return authClient;
  }
}
