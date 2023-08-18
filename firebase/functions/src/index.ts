import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import {GoalyCollections} from "./goaly_collections";

admin.initializeApp();

export const addNewUserToUsersCollection = functions.auth.user().onCreate(async (user) => {
  await GoalyCollections.users.doc(user.uid).set({});
});

export const deleteUserDataOnUserDeletion = functions.auth.user().onDelete(async (user) =>{
  await GoalyCollections.users.doc(user.uid).delete();
});
