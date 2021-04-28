# Generative Text: A Letter from Me to You! 

## Final Product:

<p align="center">
  <img src="https://media.giphy.com/media/JaBoo7XMMjVoKW6gZn/giphy.gif"=true>
</p>

## Idea:

I wanted to make a gallery-like presentation of postcards that were sent by someone everytime they met someone new. This person visits different cities around the world and sits down with a stranger in the park while they talk and eat, documents their name, the city, their food, and the weather in the postcard. 

I wanted to parse through CSV data in an easy simple way that felt nostalgic and home-like. So the postcards are generated randomly with a set sentence structure to enhance the feeling of having the same author throughout. 

## Execution:

This execution was relatively easier than the previous ones. Just some text generation with images. I made a CSV file from an excel sheet, where I included four columns: names, places, food, and weather. The code itself was not that difficult except for a few hiccups that I will discuss in the next section.

## Difficulty:

  - Drawing the function was relatively more difficult than I expected. The draw kept looping endlessly and incoherently, it all blended into each other. I fixed it with a `noloop()` function to stop the draw. 
  - I put a `mouseClicked()` function with a `loop()` in it, to get the postcards to loop at every mouse click. So the gallery is user interactive, the reader can take their time while reading.

  - Another issue I faced was calling random variables at every loop, initiating the variables in `setup()` did not work in my favour, so instead I defined a whole function `randomNo()` that called for randomised integers for every single variable in the code, and called the function inside draw which made randomisation much simpler. 
 
 ## Take-away: 
 
 This was pretty enjoyable to make, simply because of the aesthetics, the code and CSV parsing was relatively easier than I expected. 
