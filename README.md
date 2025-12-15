# Phobos Contracts

Sample Hardhat 3 Beta Project demonstrating modern Ethereum smart contract development with mocha and ethers library.

This project showcases a Hardhat 3 Beta project using mocha for tests and the ethers library for Ethereum interactions. It demonstrates best practices for smart contract development, testing, and deployment.

> **Note**: To learn more about the Hardhat 3 Beta, please visit the [Getting Started guide](https://hardhat.org/hardhat-runner/docs/getting-started). To share your feedback, join the [Hardhat 3 Beta Telegram group](https://t.me/+x_EMhn9rTj5hMGMx) or open an issue in the [GitHub issue tracker](https://github.com/NomicFoundation/hardhat/issues).

## 📋 Project Overview

This example project includes:

- ✅ A simple Hardhat configuration file with TypeScript support
- ✅ Foundry-compatible Solidity unit tests
- ✅ TypeScript integration tests using mocha and ethers.js
- ✅ Ignition deployment modules for contract deployment
- ✅ Examples demonstrating how to connect to different types of networks, including Sepolia testnet
- ✅ Configuration variables for secure private key management

## 🚀 Getting Started

### Prerequisites

- Node.js (v18 or higher)
- npm or yarn
- Git

### Installation

1. Clone the repository:
```bash
git clone <your-repo-url>
cd phobos-contracts
```

2. Install dependencies:
```bash
npm install
```

## 🧪 Running Tests

### Run All Tests

To run all the tests in the project (both Solidity and mocha tests), execute:

```bash
npx hardhat test
```

### Run Solidity Tests Only

To run only the Foundry-compatible Solidity unit tests:

```bash
npx hardhat test solidity
```

or use the npm script:

```bash
npm run test:solidity
```

### Run Mocha Tests Only

To run only the TypeScript integration tests with mocha:

```bash
npx hardhat test mocha
```

or use the npm script:

```bash
npm run test:mocha
```

## 📦 Smart Contracts

### Counter Contract

The `Counter.sol` contract is a simple example demonstrating:
- State management with a counter variable
- Increment and decrement functions
- Event emissions for state changes
- Input validation (prevents decrementing below zero)

**Contract Interface:**
```solidity
function increment() public
function decrement() public
function getCount() public view returns (uint256)
```

## 🚢 Deployment

### Deploy to Local Network

This project includes an Ignition module to deploy the Counter contract. To deploy to a locally simulated chain:

```bash
npx hardhat ignition deploy ignition/modules/Counter.ts
```

This will:
1. Start a local Hardhat network
2. Deploy the Counter contract
3. Display the deployed contract address

### Deploy to Sepolia Testnet

To deploy to Sepolia, you need an account with funds to send the transaction. The provided Hardhat configuration includes a Configuration Variable called `SEPOLIA_PRIVATE_KEY` for secure private key management.

#### Setting Up Your Private Key

You can set the `SEPOLIA_PRIVATE_KEY` variable using the hardhat-keystore plugin or by setting it as an environment variable.

**Option 1: Using hardhat-keystore (Recommended)**

To set the `SEPOLIA_PRIVATE_KEY` config variable using hardhat-keystore:

```bash
npx hardhat keystore set SEPOLIA_PRIVATE_KEY
```

This will securely prompt you for your private key and store it encrypted.

**Option 2: Using Environment Variable**

Alternatively, you can set it as an environment variable:

```bash
# On Windows (PowerShell)
$env:HARDHAT_VAR_SEPOLIA_PRIVATE_KEY="your-private-key-here"

# On Linux/Mac
export HARDHAT_VAR_SEPOLIA_PRIVATE_KEY="your-private-key-here"
```

#### Running the Deployment

After setting the variable, run the deployment to Sepolia:

```bash
npx hardhat ignition deploy --network sepolia ignition/modules/Counter.ts
```

> **Warning**: Make sure your account has enough Sepolia ETH to cover gas fees. You can get testnet ETH from a [Sepolia faucet](https://sepoliafaucet.com/).

## 🏗️ Project Structure

```
phobos-contracts/
├── contracts/              # Solidity smart contracts
│   └── Counter.sol        # Simple counter contract
├── ignition/              # Deployment modules
│   └── modules/
│       └── Counter.ts     # Counter deployment module
├── test/                  # Test files
│   ├── Counter.t.sol      # Solidity unit tests (Foundry-compatible)
│   └── Counter.test.ts    # TypeScript integration tests (mocha)
├── hardhat.config.ts      # Hardhat configuration
├── package.json           # Project dependencies
├── tsconfig.json          # TypeScript configuration
└── README.md             # This file
```

## 🛠️ Technology Stack

- **Hardhat 3 Beta**: Ethereum development environment
- **Solidity 0.8.24**: Smart contract programming language
- **Ethers.js v6**: Ethereum library for JavaScript/TypeScript
- **Mocha**: JavaScript test framework
- **Chai**: Assertion library
- **TypeScript**: Typed JavaScript
- **Foundry**: Blazing fast, portable and modular toolkit for Ethereum application development

## 📚 Available Commands

| Command | Description |
|---------|-------------|
| `npx hardhat test` | Run all tests (Solidity + mocha) |
| `npx hardhat test solidity` | Run only Solidity tests |
| `npx hardhat test mocha` | Run only mocha tests |
| `npx hardhat compile` | Compile smart contracts |
| `npx hardhat clean` | Clean artifacts and cache |
| `npx hardhat ignition deploy <module>` | Deploy contracts using Ignition |
| `npx hardhat node` | Start a local Hardhat network |
| `npx hardhat keystore set <VAR>` | Set a configuration variable securely |

## 🌐 Network Configuration

This project is configured with the following networks:

- **Hardhat Network** (default): Local development network
- **Sepolia**: Ethereum testnet for testing deployments
- **Optimism Mainnet**: Layer 2 network (example configuration)

You can add more networks by editing `hardhat.config.ts`.

## 🔐 Security Notes

- Never commit your private keys or `.env` files to version control
- Use configuration variables or the hardhat-keystore plugin for sensitive data
- Always test on testnets before deploying to mainnet
- Keep your dependencies up to date

## 📖 Additional Resources

- [Hardhat Documentation](https://hardhat.org/docs)
- [Hardhat 3 Beta Guide](https://hardhat.org/hardhat-runner/docs/getting-started)
- [Ethers.js Documentation](https://docs.ethers.org/)
- [Solidity Documentation](https://docs.soliditylang.org/)
- [Ignition Documentation](https://hardhat.org/ignition/docs/getting-started)

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License.

## 💬 Feedback

For questions or feedback about Hardhat 3 Beta:
- Join the [Hardhat 3 Beta Telegram group](https://t.me/+x_EMhn9rTj5hMGMx)
- Open an issue in the [GitHub issue tracker](https://github.com/NomicFoundation/hardhat/issues)

---

**Built with ❤️ using Hardhat 3 Beta**
