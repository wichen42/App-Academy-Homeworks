function mysteryScoping1() {
    var x = 'out of block';
    if (true) {
        var x = 'in block';
        console.log(x);
    }
    console.log(x);
}
mysteryScoping1() // returns in block twice - since x is not a const the value stays changed?
console.log("")

function mysteryScoping2() {
    const x = 'out of block';
    if (true) {
      const x = 'in block';  
      console.log(x);
    }
    console.log(x);
  }
mysteryScoping2() // returns in block out of block - changes back to const once its back in same scope?
console.log("")

/*function mysteryScoping3() {
    const x = 'out of block';
    if (true) {
      var x = 'in block';  
      console.log(x);
    }
    console.log(x);
  }
*/
//mysteryScoping3() // SyntaxError x has already been declared - throws error since x isn't set as a const in if block / scope?

function mysteryScoping4() {
    let x = 'out of block';
    if (true) {
      let x = 'in block';  
      console.log(x);
    }
    console.log(x);
  }
mysteryScoping4() // returns in block out of block - x changes only for the scope?
console.log("")

/*function mysteryScoping5() {
    let x = 'out of block';
    if (true) {
      let x = 'in block';  
      console.log(x);
    }
    let x = 'out of block again';
    console.log(x);
  }
*/
//mysteryScoping5() // SyyntaxError - x has already beed declared

function madLib(verb, noun, adnoun) {
    //let x = verb.toUppercase()
    //let y = 
    return `We shall ${verb.toUpperCase()} the ${noun.toUpperCase()} ${adnoun.toUpperCase()}`;
}

madLib('make', 'best', 'guac')

function isSubString(searchString, subString) {
  return searchString.includes(subString)
}

//console.log(isSubString("hello", "el"))
isSubString("hello", "el")

function fizzBuzz(arr) {
  let result = [];
  arr.forEach(el => {
    if ((el % 3 === 0 && el % 5 != 0) || (el % 3 != 0 && el % 5 === 0) && !(el % 3 === 0 && el % 5 === 0)) {
      result.push(el)
    }
  })
  return result
}

console.log(fizzBuzz([1,3,4,5,6,7,9,15]))

function isPrime(num) {
  for(i=2; i<num; i++) {
    if (num % i === 0) {
      return false 
    } else {
      return true
    }
  }
}

console.log(isPrime(6))

function sumOfNPrimes(n) {
  let sum = 0;
  let i = 0
  let j = 2
  while (i < n) {
    if (isPrime(j)) {
      sum+=j;
      i++;
    }
    j++;
  }
  return sum;
}

console.log(sumOfNPrimes(9))