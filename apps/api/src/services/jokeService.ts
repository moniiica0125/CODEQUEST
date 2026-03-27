import axios from 'axios';

// In-memory cache for jokes
const jokeCache = new Map();

// A function to fetch a joke from JokeAPI
async function fetchJoke() {
    const cacheKey = 'joke';

    // Check if we have a joke in the cache
    if (jokeCache.has(cacheKey)) {
        return jokeCache.get(cacheKey);
    }

    // Fetch a new joke from JokeAPI
    const response = await axios.get('https://v2.jokeapi.dev/joke/Any');
    let joke;

    if (response.data.type === 'single') {
        joke = response.data.joke;
    } else {
        joke = `${response.data.setup} - ${response.data.delivery}`;
    }

    // Cache the joke
    jokeCache.set(cacheKey, joke);
    return joke;
}

// A function to award XP when interacting with a joke
function awardXP(user) {
    const xp = 10; // Example XP for interacting with a joke
    user.xp += xp; // Assuming user.xp exists
    return user.xp;
}

export { fetchJoke, awardXP };