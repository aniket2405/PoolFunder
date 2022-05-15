const {
  ChainId,
  Fetcher,
  WETH,
  Route,
  Trade,
  TokenAmount,
  TradeType,
} = require('@uniswap/sdk')

const chainId = ChainId.MAINNET

const tokenAddress =
  '0x6B175474E89094C44Da98b954EedeAC495271d0F' //Dai token address

const tokenAddressTera =
  '0xba1e47021877a8dbbad5470d98c570859aa5c8d9' //Tera token address

const init = async () => {
  const dai = await Fetcher.fetchTokenData(
    chainId,
    tokenAddress
  )

  // const tera = await Fetcher.fetchTokenData(
  //   chainId,
  //   tokenAddressTera
  // )

  const weth = WETH[chainId]
  const pair = await Fetcher.fetchPairData(
    dai,
    weth
  )

  const route = new Route([pair], weth) // weth is the input token. Dai is the output
  const trade = new Trade(
    route,
    new TokenAmount(
      weth,
      '100000000000000000',
      TradeType.EXACT_INPUT
    )
  )
  console.log(route.midPrice.toSignificant(6))
  console.log(
    route.midPrice.invert().toSignificant(6)
  )
}

init()

// So, for 1 ether = 3336.17 DAI is available.

//creating a pair object - to interact with specific market
// We use DAI and wrap Ether
