import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import {GoalyCollections} from "./goaly_collections";
import {addGoalEdnpoint} from "./api/goals/addGoal";

admin.initializeApp();

export const addGoal = functions.https.onCall(addGoalEdnpoint);

export const addNewUserToUsersCollection = functions.auth.user().onCreate(async (user) => {
  await GoalyCollections.users.doc(user.uid).set({});
});
