import * as admin from "firebase-admin";

export class GoalyCollections {
  static get users() {
    return admin.firestore().collection("users");
  }

  static goalsOfUser(userUid: string) {
    return admin.firestore().collection("users").doc(userUid).collection("goals");
  }
}
