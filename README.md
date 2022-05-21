### HelloNFT contract project (THIS IS A ERC721 NFT, not ERC721a)

#### Install packages

   ``` npm install ```
   
#### To deploy the contract to rinkeby network, run 
  ``` npx hardhat run scripts/deploy.js --network rinkeby ```
  
 This is will deploy your contract to the Rinkeby network and will mint the NFT to your wallet and will also transfer the NFT to the address you specified in the deploy.js file.
 
#### Make sure you have the  `.env` file ready
 The .env file should be like this and the values should be put without the qoutes.
   ```
   PRIVATE_KEY=your_wallet_PRIVATE_KEY
   API_URL_KEY=your_alchemy_api_url
   ```
Make sure to play around the contract code and change the Name and metadata to your perferences.
