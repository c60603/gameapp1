//
//  game12.swift
//  gameapp1
//
//  Created by User11 on 2021/3/8.
//

import SwiftUI

var Question1:[String] = ["東西不大，臉上畫畫，漂洋過海，走遍天下(提示:書信)",           //1
                          "走的來迴路，吃的油鹽醋， 為了別人乾淨，自己一塌糊塗(提示:清潔)",
                          "田邊有口缸，盛了半缸湯，拿又拿不動，舀也舀不光 (提示:水)",
                          "一牛力氣大，長個大嘴巴，有嘴不吃草，拱地吞泥巴(提示:建築)",
                          "老公公，不動腦，一天到晚眯眯笑，你要把他推一下，搖搖擺擺倒不了(提示:玩具)",     //5
                          "小小東西有奇能，細長身體圓頭頂，沙牆上邊擦一下，能使人間放光明(提示:火)",
                          "原是深山一根柴，有人讓它上戲台，綾羅綢緞都穿過，言行聽憑人安排 (提示:玩具)",
                          "小小身子鋼骨架，有圓有扁滿身牙，遇有不平就出場，哪怕它是鐵疙瘩(提示:工具)",
                          "屋裡牽長藤，藤上結個瓜，瓜兒雖小用處大，夜裡家家需要它(提示:光)",
                          "肚裡生怕沒有它，臉上卻怕抹上它，跟著筆兒走天下，專到紙上去安家(提示:書寫)",         //10
                          "大小生來像個桃,，又無核兒又無毛，今天讓我吃了去，免得將來殺一刀(提示:食物)",
                          "一群小孩排成隊，手拉手臂挽臂，碰上火星就散開，噼啪噼啪笑聲脆(提示:過年)",
                          "鐵家小娃，身矮力大，要說舉重，冠軍數它(提示:汽車維修)",
                          "小房沒門光有窗，總也不見人來往，只要小窗燈一亮，又說又笑又歌唱(提示:廣播)",
                          "一個鐵頭老公公，肚膛裡面熱烘烘，只吃黑糧不喝水，拉下糞來紅彤彤(提示:取暖)",   //15
                          "體質堅硬又清白，文化陣地常往來，為給人們傳知識，甘願消磨自身材(提示:黑板)",
                          "兄妹二人一樣紅，各人語言不相同，慶祝節日門前站，一個西來一個東(提示:過年)",
                          "有風不動無風動，不動無風動有風，待到梧桐落葉時，主人置我於冷宮(提示:解熱)",
                          "常年站在公路旁，不叫苦來不換崗，三岔路口紮下根，專給車輛指方向(提示:方向)",
                          "遠看像座廟，近看無老道，觀音鑽進去，童子兩頭跑(提示:廟會)"]

var Answer:[String] = ["郵票","抹布","水井","掘土機","不倒翁","火柴","木偶","銼刀","電燈","墨",
                       "蛋","鞭炮","千斤頂","收音機","火爐","粉筆","門聯","扇子","路標","轎子"]

var Sequence:[Int] = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19] //題目順序
struct game12: View {
    @State private var AnswearShow = false
    @State private var number = 0
    @State private var showingAlert = false
    var body: some View {
        
        VStack(alignment: .center, spacing: 0.0){
            
            HStack{
                Text("第" + String(number+1) + "題")
                    .font(.title).foregroundColor(.white).multilineTextAlignment(.center).padding(.horizontal,150).padding(.vertical,12)
                
                Spacer()
            }.background(Color.yellow)
            
            Text(Question1[Sequence[number]]).padding()
            
            VStack{
                
                Button(action: {
                    AnswearShow = true
                },label: {
                    Text("顯示答案")
                        .font(.title2)
                    
                }).padding(.horizontal,150).padding(.vertical,10)
                if AnswearShow == true {
                    Text(Answer[Sequence[number]])
                }
                
            }
            
            Image("31456")
                .resizable()
                .scaledToFit()
            
            HStack{
                Button(action: {
                    
                    if(number > 8){
                        showingAlert = true
                        //Sequence.shuffle()
                        number = 9
                    }else{
                        number = number + 1
                        AnswearShow = false
                    }
                    
                },label: {
                    Text("下一題")
                        .font(.title)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(10.0)
                    
                }).alert(isPresented: $showingAlert) { () -> Alert in
                    let answer = "請按重新開始！"
                    return Alert(title: Text(answer))
                }.padding(.horizontal,50).padding(.vertical,30)
                
                Button(action: {
                    if(number==0)
                    {
                        Sequence.shuffle()
                        number = 0
                        AnswearShow = false
                    }
                    else{
                        Sequence.shuffle()
                        number = 0
                        AnswearShow = false
                    }
                    
                },label: {
                    Text("重新開始")
                        .font(.title)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(10.0)
                }).padding(30)
            }
            Spacer()
            
        }
        .onAppear(perform: {
            Sequence.shuffle()
        })
        .background(
            Image("1234")
                .resizable()
                .ignoresSafeArea()
        )
    }
    
}


struct game12_Previews: PreviewProvider {
    static var previews: some View {
        game12()
    }
}
