# whitelist-dApp-for-your-upcoming-NFT-Collection
Deployed App: https://whitelist-d-app-for-your-upcoming-nft-collection.vercel.app/

### Smart Contract

To build the smart contract we will be using [Hardhat](https://hardhat.org/).
Hardhat is an Ethereum development environment and framework designed for full stack development in Solidity. In simple words you can write your smart contract, deploy them, run tests, and debug your code.



 - First, you need to create a Whitelist-Daap folder where the Hardhat project and your Next.js app will later go
 - Open up a terminal and execute these commands
  ```bash
  mkdir whitelist-dApp-for-your-upcoming-NFT-Collection
  cd whitelist-dApp-for-your-upcoming-NFT-Collection
  ```
 - Then, in Whitelist-Daap folder, you will set up Hardhat project 
  ```bash
  mkdir hardhat-folder
  cd hardhat-folder
  npm init --yes
  npm install --save-dev hardhat
  ```

- In the same directory where you installed Hardhat run:

  ```bash
  npx hardhat
  ```

  - Select `Create a Javascript project`
  - Press enter for the already specified `Hardhat Project root`
  - Press enter for the question on if you want to add a `.gitignore`
  - Press enter for `Do you want to install this sample project's dependencies with npm (@nomicfoundation/hardhat-toolbox)?`

Now you have a hardhat project ready to go!

If you are not on mac, please do this extra step and install these libraries as well :)

```bash
npm install --save-dev @nomicfoundation/hardhat-toolbox
```

- Start by creating a new file inside the `contracts` directory called `Whitelist.sol`.

- Lets deploy the contract to `sepolia` network. Create a new file, or replace the default file named `deploy.js` under the `scripts` folder

- Now we will write some code to deploy the contract in `deploy.js` file.

- Now create a `.env` file in the `hardhat-tutorial` folder and add the following lines, use the instructions in the comments to get your Alchemy API Key URL and RINKEBY Private Key. Make sure that the account from which you get your sepolia private key is funded with Rinkeby Ether.

  
```
  // Go to https://www.quicknode.com/?utm_source=learnweb3&utm_campaign=generic&utm_content=sign-up&utm_medium=learnweb3, sign up, create
  // quicknode is a node provider that lets you connect to various different blockchains. We will be using it to deploy our contract through Hardhat. After creating an //account, Create an endpoint on Quicknode, select Ethereum, and then select the Goerli network. Click Continue in the bottom right and then click on Create Endpoint. //Copy the link given to you in HTTP Provider and add it to the .env file below for QUICKNODE_HTTP_URL.
// NOTE: If you previously set up a Goerli Endpoint on Quicknode during the Freshman Track, you can use the same URL as before. No need to delete it and set up a new one.
//To get your private key, you need to export it from Metamask. Open Metamask, click on the three dots, click on Account Details and then Export Private Key. MAKE SURE //YOU ARE USING A TEST ACCOUNT THAT DOES NOT HAVE MAINNET FUNDS FOR THIS. Add this Private Key below in your .env file for PRIVATE_KEY variable.

QUICKNODE_HTTP_URL="add-quicknode-http-provider-url-here"

PRIVATE_KEY="add-the-private-key-here"
  ```

- Now we will install `dotenv` package to be able to import the env file and use it in our config. Open up a terminal pointing at`hardhat-tutorial` directory and execute this command
  ```bash
  npm install dotenv
  ```
- Now open the hardhat.config.js file, we would add the `sepolia` network here so that we can deploy our contract to sepolia. Replace all the lines in the `hardhar.config.js` file with the given below lines

- Compile the contract, open up a terminal pointing at`hardhat-folder` directory and execute this command

  ```bash
     npx hardhat compile
  ```
  
- To deploy, open up a terminal pointing at`hardhat-tutorial` directory and execute this command
  ```bash
  npx hardhat run scripts/deploy.js --network sepolia
  ```
- Save the Whitelist Contract Address that was printed on your terminal in your notepad, you would need it futher down in the tutorial.

### Website

- To develop the website we will use [React](https://reactjs.org/) and [Next Js](https://nextjs.org/). React is a javascript framework used to make websites and Next.js is a React framework that also allows writing backend APIs code along with the frontend, so you don't need two separate frontend and backend services.
- First, You will need to create a new `next` app.

- To create this `next-app`, in the terminal point to whitelist-dApp-for-your-upcoming-NFT-Collection folder and type

  ```bash
  npx create-next-app@latest
  ```

  and press `enter` for all the questions

- Your folder structure should look something like

  ```
  - whitelist-dApp-for-your-upcoming-NFT-Collection
      - hardhat-folder
      - my-app
  ```

- Now to run the app, execute these commands in the terminal

  ```
  cd my-app
  npm run dev
  ```

- Now go to `http://localhost:3000`, your app should be running 🤘

- Now lets install [Web3Modal library](https://github.com/Web3Modal/web3modal). Web3Modal is an easy to use library to help developers easily allow their users to connect to your dApps with all sorts of different wallets. By default Web3Modal Library supports injected providers like (Metamask, Dapper, Gnosis Safe, Frame, Web3 Browsers, etc) and WalletConnect, You can also easily configure the library to support Portis, Fortmatic, Squarelink, Torus, Authereum, D'CENT Wallet and Arkane.
(Here's a live example on [Codesandbox.io](https://codesandbox.io/s/j43b10))

- Open up a terminal pointing at`my-app` directory and execute this command

  ```bash
  npm install web3modal
  ```

- In the same terminal also install `ethers.js`

  ```bash
  npm install ethers
  ```

- In your my-app/public folder, download [this image](https://github.com/LearnWeb3DAO/Whitelist-Dapp/blob/main/my-app/public/crypto-devs.svg) and rename it to `crypto-devs.svg`
- Now go to app folder and replace all the contents of `page.modules.css` file with the CSS code, this would add some styling to your dapp.

- Add js code in page.js

- Now create a new folder under the my-app folder and name it `constants`.
- In the constants folder create a file, `index.js` and paste the following code.

  ```js
  export const WHITELIST_CONTRACT_ADDRESS = "YOUR_WHITELIST_CONTRACT_ADDRESS";
  export const abi = YOUR_ABI;
  ```
  
- Replace `"YOUR_WHITELIST_CONTRACT_ADDRESS"` with the address of the whitelist contract that you deployed.
- Replace `"YOUR_ABI"` with the ABI of your Whitelist Contract. To get the ABI for your contract, go to your `hardhat-tutorial/artifacts/contracts/Whitelist.sol` folder and from your `Whitelist.json` file get the array marked under the `"abi"` key (it will be. a huge array, close to 100 lines if not more).


- Now in your terminal which is pointing to `my-app` folder, execute

  ```bash
  npm run dev
  ```

Your whitelist dapp should now work without errors 🚀

### Push to github

Make sure before proceeding you have [pushed all your code to github](https://medium.com/hackernoon/a-gentle-introduction-to-git-and-github-the-eli5-way-43f0aa64f2e4) :)

---

## Deploying your dApp

We will now deploy your dApp, so that everyone can see your website and you can share it with all of your LearnWeb3 DAO friends.

- Go to [Vercel](https://vercel.com/) and sign in with your GitHub
- Then click on `New Project` button and then select your Whitelist dApp repo
- ![](https://i.imgur.com/ZRjfkCE.png)
- When configuring your new project, Vercel will allow you to customize your `Root Directory`
- Click `Edit` next to `Root Directory` and set it to `my-app`
- Select the Framework as `Next.js`
- Click `Deploy`
- Now you can see your deployed website by going to your dashboard, selecting your project, and copying the URL from there!

