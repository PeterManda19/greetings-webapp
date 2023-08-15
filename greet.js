/**
 * Factory function to create an object with greet and getGreetCount methods.
 * @returns {Object} An object with greet and getGreetCount methods.
 */
export default function createGreetMessage() {
  // Initialise overall greetCount
  let totalGreetCount = 0;

  // Declare global Object Literal variable to store greeted names
  let namesGreeted = {};

  /**
   * Generates a greeting based on the provided name and language.
   * @param {string} name - The name to include in the greeting.
   * @param {string} language - The language for the greeting.
   * @returns {string} The generated greeting.
   */
  function generateGreeting(name, language) {
    switch (language) {
      case 'zulu':
        return `Sawubona, ${name}!`;
      case 'xhosa':
        return `Molo, ${name}!`;
      case 'sepedi':
        return `Dumela, ${name}!`;
      default:
        return `Hello, ${name}!`;
    }
  }

  /**
   * Generates a greeting, increments greetCount, and returns the greeting.
   * @param {string} name - The name to include in the greeting.
   * @param {string} language - The language for the greeting.
   * @returns {string} The generated greeting.
   */
  function greet(name, language) {
    // Generate the greeting using the generateGreeting function
    const greeting = generateGreeting(name, language);

    // Check if the person has been greeted before
    if (!namesGreeted[name]) {
      namesGreeted[name] = true;
      // Increment the overall greetCount
      totalGreetCount++;
    }

    // Store the updated greetCount in localStorage
    //localStorage.setItem('greetCount', totalGreetCount.toString());

    // Store the names greeted in localStorage
    //localStorage.setItem('namesGreeted', JSON.stringify(namesGreeted));

    // Return the generated greeting
    return greeting;
  }

  /**
   * Retrieves the greetCount for the specified language.
   * If no language is provided, returns the total greetCount.
   * @param {string} [language] - The language for which to retrieve the greetCount.
   * @returns {number} The greetCount for the total greetCount.
   */
  function getGreetCount(language) {
    if (language) {
      // Return the total greetCount
      return Object.keys(namesGreeted).length; //totalGreetCount;
    } else {
      // Return the stored greet count
      return totalGreetCount;//localStorage.getItem('greetCount');
    }
  } 

  function resetGreetCount() {
    totalGreetCount = 0;
  }
  return {
    greet: greet,
    getGreetCount: getGreetCount,
    resetGreetCount: resetGreetCount
  };
}
