exports.test = async (event, context) => {
    try {
      console.log("Lambda executed");
      console.log("Environment:", process.env.env);      
      return {
        statusCode: 200,
        body: JSON.stringify({ message: "Lambda Created successful" }),
      };
    } catch (error) {
      console.error("Error:", error);
      return {
        statusCode: 500,
        body: JSON.stringify({ message: "Internal Server Error" }),
      };
    }
  };
  