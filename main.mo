import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var cValue: Float = 300;
  // cValue := 100;

  stable var startTime = Time.now();
  Debug.print(debug_show(startTime));

  let id = 23940834239423942390;
    // Debug.print(debug_show(id));

  public func topUp(amt: Float) {
    cValue += amt;
      Debug.print(debug_show(cValue))
  };

  public func withdrawl(amts: Float) {
    let tValue: Float = cValue - amts;
    if (tValue >= 0) {
      cValue -= amts;
      Debug.print(debug_show(cValue));
    } else {
      Debug.print("Enter Value less then current Value");
    }
  };

  public query func checkBalance(): async Float {
    return cValue;
  };

  //i have not included this function jsut because it will be difficult for people to understand
  //why the amount is increasing unevenly thinking that the app is not stable and giving incorrent outputs  
  public func compund() {
    let currentTime = Time.now();
    let timeENS = currentTime - startTime;
    let timeES = timeENS / 1000000000;
    cValue := cValue * (1.01 ** Float.fromInt(timeES));
    startTime := currentTime;
  }

  //topUp();
}
