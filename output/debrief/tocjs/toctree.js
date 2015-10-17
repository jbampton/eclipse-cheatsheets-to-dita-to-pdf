
      var tree;
      
      function treeInit() {
      tree = new YAHOO.widget.TreeView("treeDiv1");
      var root = tree.getRoot();
    
   
   
   var objd4e46 = { label: "Getting started with Debrief NG", href:"dita/intro_composite.html", target:"contentwin" };
    var d4e46 = new YAHOO.widget.TextNode(objd4e46, root, false);
   var objd4e76 = { label: "Controlling what you view", href:"dita/analysis_composite.html", target:"contentwin" };
    var d4e76 = new YAHOO.widget.TextNode(objd4e76, root, false);
   var objd4e106 = { label: "Single Sided Reconstruction in Debrief", href:"dita/s2r_composite.html", target:"contentwin" };
    var d4e106 = new YAHOO.widget.TextNode(objd4e106, root, false);
   var objd4e146 = { label: "Walkthrough", href:"dita/satc_composite.html", target:"contentwin" };
    var d4e146 = new YAHOO.widget.TextNode(objd4e146, root, false);

      tree.draw(); 
      } 
      
      YAHOO.util.Event.addListener(window, "load", treeInit); 
    