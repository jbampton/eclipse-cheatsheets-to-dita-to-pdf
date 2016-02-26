
      var tree;
      
      function treeInit() {
      tree = new YAHOO.widget.TreeView("treeDiv1");
      var root = tree.getRoot();
    
   
   
   var objd4e47 = { label: "Getting started with Debrief NG", href:"dita/intro_composite.html", target:"contentwin" };
    var d4e47 = new YAHOO.widget.TextNode(objd4e47, root, false);
   var objd4e77 = { label: "Controlling what you view", href:"dita/analysis_composite.html", target:"contentwin" };
    var d4e77 = new YAHOO.widget.TextNode(objd4e77, root, false);
   var objd4e107 = { label: "Single Sided Reconstruction in Debrief", href:"dita/s2r_composite.html", target:"contentwin" };
    var d4e107 = new YAHOO.widget.TextNode(objd4e107, root, false);
   var objd4e147 = { label: "Walkthrough", href:"dita/satc_composite.html", target:"contentwin" };
    var d4e147 = new YAHOO.widget.TextNode(objd4e147, root, false);

      tree.draw(); 
      } 
      
      YAHOO.util.Event.addListener(window, "load", treeInit); 
    