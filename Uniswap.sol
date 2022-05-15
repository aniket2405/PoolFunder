pragma solidity ^0.7.0;

interface IUniswap {
    function swapExactTokensForEth(
     uint amountIn,
     uint amountOutMin,
     address[] calldata path,
     address to,
     uint deadline)
     external 
     returns (uint[] memory amounts);
     function WETH() external pure returns (address);  //to return the address of wrapped ether

}

interface IERC20 {

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    )
    external 
    returns (bool);

    function approve(address spender,
    uint256 amount
    )
    external
    returns (bool); 
}

contract Uniswap {

    IUniswap uniswap;

    constructor(address _uniswap) {
        uniswap = IUniswap(_uniswap);
    }

    function swapExactTokensForEth(
        address token,
        uint amountIn,       // how much token are we willing to spend
        uint amountOutMin,   //how much token are we willing to buy
        uint deadline)
        external {
            IERC20(token).transferFrom(msg.sender, address(this), amountIn);
            address[] memory path = new address[](2);
            path[0] = token;
            path[1] = uniswap.WETH();  //returns the address of WETH

            //approve uniswap to approve our token

            IERC20(token).approve(address(uniswap), amountIn);

            uniswap.swapExactTokensForEth(
                amountIn,
                amountOutMin,
                path,
                msg.sender,
                deadline
            );
        }

}