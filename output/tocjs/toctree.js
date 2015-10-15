
      var tree;
      
      function treeInit() {
      tree = new YAHOO.widget.TreeView("treeDiv1");
      var root = tree.getRoot();
    
   
   var objd4e9 = { label: "Getting started with Debrief NG", href:"dita/intro_composite.html", target:"contentwin" };
    var d4e9 = new YAHOO.widget.TextNode(objd4e9, root, false);
   var objd4e20 = { label: "Controlling what you view", href:"dita/analysis_composite.html", target:"contentwin" };
    var d4e20 = new YAHOO.widget.TextNode(objd4e20, root, false);
   var objd4e31 = { label: "Single Sided Reconstruction in Debrief", href:"dita/s2r_composite.html", target:"contentwin" };
    var d4e31 = new YAHOO.widget.TextNode(objd4e31, root, false);
   var objd4e51 = { label: "Walkthrough", href:"dita/satc_composite.html", target:"contentwin" };
    var d4e51 = new YAHOO.widget.TextNode(objd4e51, root, false);

      tree.draw(); 
      } 
      
      YAHOO.util.Event.addListener(window, "load", treeInit); 
    