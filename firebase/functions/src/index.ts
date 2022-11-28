import * as functions from "firebase-functions";

export const helloWorld = functions.https.onCall((request, context) => {
  functions.logger.info("Hello test!", {structuredData: true});
  const data = JSON.stringify(context.auth ?? {});
  functions.logger.info(request);
  return {message: data, code: 200};
});
