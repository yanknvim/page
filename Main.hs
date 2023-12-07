{-#LANGUAGE OverloadedStrings #-}
module Main where

import Hakyll

main :: IO ()
main = hakyll $ do
	match "static/*" $ do
		route idRoute
		compile copyFileCompiler

	match "templates/*" $ compile templateCompiler

	match "*.html" $ do
		route idRoute
		compile $ pandocCompiler
			>>= loadAndApplyTemplate "templates/default.html" defaultContext
			>>= relativizeUrls

