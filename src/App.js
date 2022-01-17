import { Web3ReactProvider } from '@web3-react/core'
import { Web3Provider } from '@ethersproject/providers'
import ContentComponent from './ContentComponent'
function App() {
  const getLibrary = (provider) => {
    const library = new Web3Provider(provider, 'any')
    library.pollingInterval = 15000
    return library
  }

  return (
    <Web3ReactProvider getLibrary={getLibrary}>
      <ContentComponent />
    </Web3ReactProvider>
  )
}

export default App
