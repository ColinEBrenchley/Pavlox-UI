import controlP5.*;
import processing.serial.*;

Serial myPort;
ControlP5 cp5;

String textValue_1 = "";
String textValue_2 = "";
String textValue_3 = "";
String textValue_4 = "";
String textValue_5 = "";
String textValue_6 = "";
String currentTab = "";


void setup() {  
  size(720, 400);
  cp5 = new ControlP5(this);
  
  myPort = new Serial(this, "COM6", 9600);
  
  PFont pfont = createFont("",20,true); // use true/false for smooth/no-smooth
  ControlFont font = new ControlFont(pfont,241);
  
  //Below are the definition of the tabs, tasks  1-6
  //Setting the height and width of the tabs 
  cp5.getTab("default")
     .setLabel("Lock in")
     .setHeight(30)
     .setWidth(100)
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(true)
     .setSize(18);
  
  cp5.getTab("Task_1")
     .activateEvent(true)
     .setLabel("Task 1: ")
     .setHeight(30)
     .setWidth(100)
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(true)
     .setSize(18)
     ;
     
  cp5.getTab("Task_2")
     .activateEvent(true)
     .setLabel("Task 2: ")
     .setHeight(30)
     .setWidth(100)
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(true)
     .setSize(18)
     ;
     
  cp5.getTab("Task_3")
     .activateEvent(true)
     .setLabel("Task 3: ")
     .setHeight(30)
     .setWidth(100)
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(true)
     .setSize(18)
     ;
     
  cp5.getTab("Task_4")
     .activateEvent(true)
     .setLabel("Task 4: ")
     .setHeight(30)
     .setWidth(100)
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(true)
     .setSize(18)
     ;
     
  cp5.getTab("Task_5")
     .activateEvent(true)
     .setLabel("Task 5: ")
     .setHeight(30)
     .setWidth(100)
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(true)
     .setSize(18)
     ;
     
  cp5.getTab("Task_6")
     .activateEvent(true)
     .setLabel("Task 6: ")
     .setHeight(30)
     .setWidth(100)
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(true)
     .setSize(18)
     ;
     
  //Adding the button that activates the Lock-In-Feature which sends all the tasks to the arduino
  //
  cp5.addButton("LOCK_IN")
   .setPosition(200, 100)
   .setSize(300, 200)     
   .setLabel("LOCK IN")
   .getCaptionLabel()
   .setFont(font)
   .toUpperCase(false)
   .setSize(30)
   ;
  
  //Adding the Textfields Tasks 1-6
  // 
  
  cp5.addTextfield("Task1")
     .setPosition(20, 130)
     .setSize(200, 20)
     .setLabel("Task 1: ")
     .moveTo("Task_1")
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(false)
     .setSize(16)
     ;
     
  cp5.addTextfield("Task2")
     .setPosition(20, 130)
     .setSize(200, 20)
     .moveTo("Task_2")
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(false)
     .setSize(16)
     ;
  cp5.addTextfield("Task3")
     .setPosition(20, 130)
     .setSize(200, 20)
     .moveTo("Task_3")
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(false)
     .setSize(16)
     ;
  cp5.addTextfield("Task4")
     .setPosition(20, 130)
     .setSize(200, 20)
     .moveTo("Task_4")
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(false)
     .setSize(16)
     ;
  cp5.addTextfield("Task5")
     .setPosition(20, 130)
     .setSize(200, 20)
     .moveTo("Task_5")
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(false)
     .setSize(16)
     ;
  cp5.addTextfield("Task6")
     .setPosition(20, 130)
     .setSize(200, 20)
     .moveTo("Task_6")
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(false)
     .setSize(16)
     ;
     
}

void draw() {
  background(20);
  fill(255);

  text(cp5.get(Textfield.class,"Task1").getText(), 250, 145);
  text(cp5.get(Textfield.class,"Task2").getText(), 250, 145);
  text(cp5.get(Textfield.class,"Task3").getText(), 250, 145);
  text(cp5.get(Textfield.class,"Task4").getText(), 250, 145);
  text(cp5.get(Textfield.class,"Task5").getText(), 250, 145);
  text(cp5.get(Textfield.class,"Task6").getText(), 250, 145);
  
  if(currentTab == "Task_1"){
        text(textValue_1, 250, 145);
      }
  if(currentTab == "Task_2"){
        text(textValue_2, 250, 145);
      }
  if(currentTab == "Task_3"){
        text(textValue_3, 250, 145);
      }
  if(currentTab == "Task_4"){
        text(textValue_4, 250, 145);
      }
  if(currentTab == "Task_5"){
        text(textValue_5, 250, 145);
      }
  if(currentTab == "Task_6"){
        text(textValue_6, 250, 145);
      } 
}

void controlEvent(ControlEvent theEvent) {
  if(theEvent.isTab()) {
    println("got an event from tab : "+theEvent.getTab().getName());
    currentTab = theEvent.getTab().getName();
    }
  if(theEvent.isAssignableFrom(Textfield.class)) {
      println("controlEvent: accessing a string from controller '"
              +theEvent.getName()+"': "
              +theEvent.getStringValue()
              );
      if(currentTab == "Task_1"){
        textValue_1 = theEvent.getStringValue();
      }
      if(currentTab == "Task_2"){
        textValue_2 = theEvent.getStringValue();
      }
      if(currentTab == "Task_3"){
        textValue_3 = theEvent.getStringValue();
      }
      if(currentTab == "Task_4"){
        textValue_4 = theEvent.getStringValue();
      }
      if(currentTab == "Task_5"){
        textValue_5 = theEvent.getStringValue();
      }
      if(currentTab == "Task_6"){
        textValue_6 = theEvent.getStringValue();
      }      
     }
}

public void LOCK_IN(){
  //Sends the Text_Values to the arduino
  
    if(textValue_1 != "") 
    {                           
      myPort.write("1" + textValue_1 + "\n");         
      println("Sent");
    }
    if(textValue_2 != "") 
    {                           
      myPort.write("2" + textValue_2 + "\n");         
      println("Sent");
    }
    if(textValue_3 != "") 
    {                           
      myPort.write("3" + textValue_3 + "\n");         
      println("Sent");
    }
    if(textValue_4 != "") 
    {                           
      myPort.write("4" + textValue_4 + "\n");         
      println("Sent");
    }
    if(textValue_5 != "") 
    {                           
      myPort.write("5" + textValue_5 + "\n");         
      println("Sent");
    }
    if(textValue_6 != "") 
    {                          
      myPort.write("6" + textValue_6 + "\n");        
      println("Sent");
    }
}
