{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_tests (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,0,1] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/aapokoiv/koulu/haskell/haskell-mooc/exercises/.stack-work/install/x86_64-linux-tinfo6/87ededd6bbb800e7ba15aa267b43eb8a807f684dfec5f860717b25131ab16ecb/9.2.8/bin"
libdir     = "/home/aapokoiv/koulu/haskell/haskell-mooc/exercises/.stack-work/install/x86_64-linux-tinfo6/87ededd6bbb800e7ba15aa267b43eb8a807f684dfec5f860717b25131ab16ecb/9.2.8/lib/x86_64-linux-ghc-9.2.8/tests-0.0.1-409rslOM85jJdNvoEvwqzu"
dynlibdir  = "/home/aapokoiv/koulu/haskell/haskell-mooc/exercises/.stack-work/install/x86_64-linux-tinfo6/87ededd6bbb800e7ba15aa267b43eb8a807f684dfec5f860717b25131ab16ecb/9.2.8/lib/x86_64-linux-ghc-9.2.8"
datadir    = "/home/aapokoiv/koulu/haskell/haskell-mooc/exercises/.stack-work/install/x86_64-linux-tinfo6/87ededd6bbb800e7ba15aa267b43eb8a807f684dfec5f860717b25131ab16ecb/9.2.8/share/x86_64-linux-ghc-9.2.8/tests-0.0.1"
libexecdir = "/home/aapokoiv/koulu/haskell/haskell-mooc/exercises/.stack-work/install/x86_64-linux-tinfo6/87ededd6bbb800e7ba15aa267b43eb8a807f684dfec5f860717b25131ab16ecb/9.2.8/libexec/x86_64-linux-ghc-9.2.8/tests-0.0.1"
sysconfdir = "/home/aapokoiv/koulu/haskell/haskell-mooc/exercises/.stack-work/install/x86_64-linux-tinfo6/87ededd6bbb800e7ba15aa267b43eb8a807f684dfec5f860717b25131ab16ecb/9.2.8/etc"

getBinDir     = catchIO (getEnv "tests_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "tests_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "tests_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "tests_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "tests_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "tests_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
