module Browser.Cookie
  ( set, get, remove
  ) where


import Prelude (Unit, map)

import DOM (DOM)
import Data.Argonaut (Json)
import Data.Nullable (Nullable, toNullable, toMaybe)
import Data.Maybe (Maybe)
import Control.Monad.Eff (Eff)
import Control.Monad.Eff.Uncurried (EffFn3, EffFn1, runEffFn3, runEffFn1)


foreign import setImpl :: forall eff. EffFn3 (dom :: DOM | eff) String Json (Nullable {expires :: Int}) Unit

foreign import getImpl :: forall eff. EffFn1 (dom :: DOM | eff) String (Nullable Json)

foreign import removeImpl :: forall eff. EffFn1 (dom :: DOM | eff) String Unit


set :: forall eff. String -> Json -> Maybe {expires :: Int} -> Eff (dom :: DOM | eff) Unit
set k v mExp = runEffFn3 setImpl k v (toNullable mExp)

get :: forall eff. String -> Eff (dom :: DOM | eff) (Maybe Json)
get k = map toMaybe (runEffFn1 getImpl k)

remove :: forall eff. String -> Eff (dom :: DOM | eff) Unit
remove = runEffFn1 removeImpl
