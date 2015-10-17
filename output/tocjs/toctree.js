
      var tree;
      
      function treeInit() {
      tree = new YAHOO.widget.TreeView("treeDiv1");
      var root = tree.getRoot();
    
   
   
   var objd4e27 = { label: "Getting started with Debrief NG", href:"dita/intro_composite.html", target:"contentwin" };
    var d4e27 = new YAHOO.widget.TextNode(objd4e27, root, false);
   var objd4e42 = { label: "Controlling what you view", href:"dita/analysis_composite.html", target:"contentwin" };
    var d4e42 = new YAHOO.widget.TextNode(objd4e42, root, false);
   var objd4e57 = { label: "Single Sided Reconstruction in Debrief", href:"dita/s2r_composite.html", target:"contentwin" };
    var d4e57 = new YAHOO.widget.TextNode(objd4e57, root, false);
   var objd4e82 = { label: "Walkthrough", href:"dita/satc_composite.html", target:"contentwin" };
    var d4e82 = new YAHOO.widget.TextNode(objd4e82, root, false);

      tree.draw(); 
      } 
      
      YAHOO.util.Event.addListener(window, "load", treeInit); 
    