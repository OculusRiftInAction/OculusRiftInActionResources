
{
  { # $ 
    { $ .{'package org.saintandreas;

$ .'import org.saintandreas.resources.Resource;



  $ .'final String path;

  ExampleResource(String path) {
  $  .'this.path = path;
  }

  $ .'@Override
  $ .'String getPath() {
  $   .'return path;
  }
}
