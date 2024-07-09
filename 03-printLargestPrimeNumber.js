/**
 *  Write a function that looks for prime numbers for a certain amount of time. When that
 *  amount of time has elapsed, it prints the largest prime number it found, and then returns
 *  nil. invoked like this to run for 5 seconds: find_prime_number(5)
 */

const ONE_SECOND_IN_MS = 1000;

// a number is prime if it is greater than 1 and cannot be divided by any number other than 1 and itself
/**
 * @method isPrimeNumber
 * @desc Checks if a given number is a prime number.
 * @param {number} num - The number to check.
 * @returns {boolean} - True if the number is prime, false otherwise.
 */
const isPrimeNumber = (num) => {
  if (num <= 1) return false;
  // check if the number is divisible by any number from 2 to the square root of the number
  for (let i = 2, sqrt = Math.sqrt(num); i <= sqrt; i++) {
    // if the number is divisible by any number, it is not prime
    if (num % i === 0) return false;
  }
  return true;
};

/**
 * @method generateRandomNumber
 * @param {max} - The maximum value of the random number.
 * @desc Generates a random number
 * @returns {number} - The generated random number.
 */
const generateRandomNumber = (max = 999) => {
  return Math.floor(Math.random() * max);
};

/**
 * @method printLargestPrimeNumber
 * @desc Finds and prints the largest prime number found within a specified time, but returns null.
 * @param {number} timeSeconds - The time duration in seconds to search for prime numbers.
 * @returns {null} - Returns null.
 */
const printLargestPrimeNumber = (timeSeconds) => {
  let largestPrimeNumber = 0;
  let secondsElapsed = 0;

  const intervalId = setInterval(() => {
    secondsElapsed += 1;
    // uncomment the line below to see the progress
    // console.log(
    //   `${secondsElapsed} seconds elapsed out of ${timeSeconds}, current largest prime number: ${largestPrimeNumber}`
    // );
    const num = generateRandomNumber(999);
    if (isPrimeNumber(num)) {
      largestPrimeNumber = Math.max(largestPrimeNumber, num);
    }
    if (secondsElapsed >= timeSeconds) {
      clearInterval(intervalId);
      console.log('Largest prime number:', largestPrimeNumber);
    }
  }, ONE_SECOND_IN_MS);

  return null;
};

// tests go here. comment out the test(s) you want to run, add your own if desired, the parameter is the number of seconds to run the function
// printLargestPrimeNumber(2);
printLargestPrimeNumber(6);
