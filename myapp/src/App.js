import logo from './logo.svg';
import './App.css';
import { useState } from 'react';
import { ethers } from 'ethers';
import { abi } from './abi';

function App() {

  const [addi, setPublickey] = useState();

  const [useData, setUserData] = useState({chainName:"", chainId:"", contractAddress:"", tokenId:""});

  const [qm, setqm] = useState("px");

  async function connect() {

  const { ethereum } = window;
  const provider = new ethers.providers.Web3Provider(ethereum);
  if (ethereum.isMetaMask) {
    const accounts = await provider.send("eth_requestAccounts", [])
    const { name, chainId } = await provider.getNetwork();
    setPublickey(accounts[0]);
  } 

}


async function outpot() {
  const Address = "0x7C60148578483328153C55989d86dA3627521871";
  const provider = new ethers.providers.Web3Provider(window.ethereum);
  const signer = provider.getSigner();
  const contract = new ethers.Contract(Address, abi, signer);

  contract.xyz(String("scrollAlpha"), 534353, Address, 0);

  console.log(document.getElementsByClassName('chainName').value);
  
  setqm("pp");

}

let name, value;

const handleInput = (e) => {
  name = e.target.name;
  value = e.target.value;
  setUserData({...useData, [name]:value})
  //console.log(e.target.value)

}
let zzz = useData.chainName + useData.chainId + useData.contractAddress + useData.tokenId;

  return (
    <>

    <button className='wallet' onClick={connect}>Connect Wallet</button>

        <div class="container">
        <section class="section">
          <h2>UANS: Universal Asset Numbering Scheme</h2>
          <h3>for Scroll Alpha Testnet, Gnosis Chiado Testnet, XDC Network Mainnet, and Goerli Ethereum Testnet</h3>
          <div class="input-group">
            <label>Chain Name:</label>
            <input type="text" id="chainName" className='chainName' name='chainName' onChange={handleInput}/>
          </div>

          <div class="input-group">
            <label>Chain ID:</label>
            <input type="text" id="chainId" name='chainId' onChange={handleInput}/>
          </div>

          <div class="input-group">
            <label>Contract Address:</label>
            <input type="text" id="contractAddress"  name='contractAddress' onChange={handleInput}/>
          </div>

          <div class="input-group">
            <label>Token ID:</label>
            <input type="text" id="tokenId" name='tokenId' onChange={handleInput} />
             </div>

        </section> 
        <section class="section output">
          <button onClick={outpot}>Generate Outputs</button>
          <div id="outputContainer"></div>
        </section>
      </div>

      {
        qm=="pp" ? 
        <>{zzz}</>
        :
        <></>
      } 

    </>
  );
}

export default App;





