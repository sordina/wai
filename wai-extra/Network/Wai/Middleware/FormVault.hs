{-# LANGUAGE OverloadedStrings #-}

import Network.Wai
import Network.Wai.Parse
import Data.Vault

formValut :: Key [Param] -> Middleware
formValut key app req = do

  parsedForm <- parseRequestBody lbsBackEnd req

  let newVault = insert key (fst parsedForm) (vault req)

  app $ req {vault = newVault}
