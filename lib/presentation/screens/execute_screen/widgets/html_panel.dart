import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_toeic_quiz2/core_ui/extensions/extensions.dart';

const _testStr = r"""
<html><head><meta content="text/html; charset=UTF-8" http-equiv="content-type"><style type="text/css">ol{margin:0;padding:0}table td,table th{padding:0}.c7{border-right-style:solid;padding:5pt 5pt 5pt 5pt;border-bottom-color:#ff0000;border-top-width:1pt;border-right-width:1pt;border-left-color:#ff0000;vertical-align:top;border-right-color:#ff0000;border-left-width:1pt;border-top-style:solid;border-left-style:solid;border-bottom-width:1pt;width:72.8pt;border-top-color:#ff0000;border-bottom-style:solid}.c13{border-right-style:solid;padding:5pt 5pt 5pt 5pt;border-bottom-color:#ff0000;border-top-width:1pt;border-right-width:1pt;border-left-color:#ff0000;vertical-align:top;border-right-color:#ff0000;border-left-width:1pt;border-top-style:solid;border-left-style:solid;border-bottom-width:1pt;width:77.2pt;border-top-color:#ff0000;border-bottom-style:solid}.c6{border-right-style:solid;padding:5pt 5pt 5pt 5pt;border-bottom-color:#ff0000;border-top-width:1pt;border-right-width:1pt;border-left-color:#ff0000;vertical-align:top;border-right-color:#ff0000;border-left-width:1pt;border-top-style:solid;border-left-style:solid;border-bottom-width:1pt;width:58.5pt;border-top-color:#ff0000;border-bottom-style:solid}.c5{border-right-style:solid;padding:5pt 5pt 5pt 5pt;border-bottom-color:#ff0000;border-top-width:1pt;border-right-width:1pt;border-left-color:#ff0000;vertical-align:top;border-right-color:#ff0000;border-left-width:1pt;border-top-style:solid;border-left-style:solid;border-bottom-width:1pt;width:128.2pt;border-top-color:#ff0000;border-bottom-style:solid}.c8{border-right-style:solid;padding:5pt 5pt 5pt 5pt;border-bottom-color:#ff0000;border-top-width:1pt;border-right-width:1pt;border-left-color:#ff0000;vertical-align:top;border-right-color:#ff0000;border-left-width:1pt;border-top-style:solid;border-left-style:solid;border-bottom-width:1pt;width:114.8pt;border-top-color:#ff0000;border-bottom-style:solid}.c1{color:#000000;font-weight:400;text-decoration:none;vertical-align:baseline;font-size:11pt;font-family:"Arial";font-style:normal}.c0{padding-top:0pt;padding-bottom:0pt;line-height:1.0;orphans:2;widows:2;text-align:left}.c2{padding-top:0pt;padding-bottom:0pt;line-height:1.15;orphans:2;widows:2;text-align:left}.c9{border-spacing:0;border-collapse:collapse;margin-right:auto}.c11{background-color:#ffffff;max-width:396pt;padding:0pt 0pt 0pt 0pt}.c4{height:53.2pt}.c14{height:69.2pt}.c12{height:55.8pt}.c3{height:11pt}.c10{height:42.2pt}.title{padding-top:0pt;color:#000000;font-size:26pt;padding-bottom:3pt;font-family:"Arial";line-height:1.15;page-break-after:avoid;orphans:2;widows:2;text-align:left}.subtitle{padding-top:0pt;color:#666666;font-size:15pt;padding-bottom:16pt;font-family:"Arial";line-height:1.15;page-break-after:avoid;orphans:2;widows:2;text-align:left}li{color:#000000;font-size:11pt;font-family:"Arial"}p{margin:0;color:#000000;font-size:11pt;font-family:"Arial"}h1{padding-top:20pt;color:#000000;font-size:20pt;padding-bottom:6pt;font-family:"Arial";line-height:1.15;page-break-after:avoid;orphans:2;widows:2;text-align:left}h2{padding-top:18pt;color:#000000;font-size:16pt;padding-bottom:6pt;font-family:"Arial";line-height:1.15;page-break-after:avoid;orphans:2;widows:2;text-align:left}h3{padding-top:16pt;color:#434343;font-size:14pt;padding-bottom:4pt;font-family:"Arial";line-height:1.15;page-break-after:avoid;orphans:2;widows:2;text-align:left}h4{padding-top:14pt;color:#666666;font-size:12pt;padding-bottom:4pt;font-family:"Arial";line-height:1.15;page-break-after:avoid;orphans:2;widows:2;text-align:left}h5{padding-top:12pt;color:#666666;font-size:11pt;padding-bottom:4pt;font-family:"Arial";line-height:1.15;page-break-after:avoid;orphans:2;widows:2;text-align:left}h6{padding-top:12pt;color:#666666;font-size:11pt;padding-bottom:4pt;font-family:"Arial";line-height:1.15;page-break-after:avoid;font-style:italic;orphans:2;widows:2;text-align:left}</style></head><body class="c11 doc-content"><p class="c2"><span class="c1">To: Joseph Morgan &lt;joseph.morgan@peltergraphics.com&gt;</span></p><p class="c2"><span class="c1">From: administrator@costaseminars.org</span></p><p class="c2"><span class="c1">Date: May 31</span></p><p class="c2"><span class="c1">Subject: Book order</span></p><p class="c2"><span class="c1">Dear Mr. Morgan,</span></p><p class="c2 c3"><span class="c1"></span></p><p class="c2"><span class="c1">Thank you for registering for Emilio Costa&#39;s seminar on June 11 at the Rothford Business Center. We are glad you took advantage of the opportunity for conference participants to purchase some of Emilio Costa&#39;s graphic-design books at a discounted price. The information below is a confirmation of your order. The books will be waiting for you at the check-in desk on the day of the seminar. Please note that we will accept any major credit card for payment. We are looking forward to seeing you on June 11.</span></p><p class="c2 c3"><span class="c1"></span></p><a id="t.de33ad0ff8568f6e240a19220aeb5f82b3ff6b03"></a><a id="t.0"></a><table class="c9"><tr class="c4"><td class="c6" colspan="1" rowspan="1"><p class="c0"><span class="c1">Quantity</span></p></td><td class="c8" colspan="1" rowspan="1"><p class="c0"><span class="c1">Title</span></p></td><td class="c7" colspan="1" rowspan="1"><p class="c0"><span class="c1">Price</span></p></td><td class="c13" colspan="1" rowspan="1"><p class="c0"><span class="c1">Discounted Price</span></p></td><td class="c5" colspan="1" rowspan="1"><p class="c0"><span class="c1">Total Price</span></p></td></tr><tr class="c12"><td class="c6" colspan="1" rowspan="1"><p class="c0"><span class="c1">1</span></p></td><td class="c8" colspan="1" rowspan="1"><p class="c0"><span class="c1">Perfect Figures: Making Data Visually Appealing</span></p></td><td class="c7" colspan="1" rowspan="1"><p class="c0"><span class="c1">$22.00</span></p></td><td class="c13" colspan="1" rowspan="1"><p class="c0"><span class="c1">$17.60</span></p></td><td class="c5" colspan="1" rowspan="1"><p class="c0"><span class="c1">$17.60</span></p></td></tr><tr class="c10"><td class="c6" colspan="1" rowspan="1"><p class="c0"><span class="c1">1</span></p></td><td class="c8" colspan="1" rowspan="1"><p class="c0"><span class="c1">Logos in the Information Age</span></p></td><td class="c7" colspan="1" rowspan="1"><p class="c0"><span class="c1">$18.00</span></p></td><td class="c13" colspan="1" rowspan="1"><p class="c0"><span class="c1">$14.40</span></p></td><td class="c5" colspan="1" rowspan="1"><p class="c0"><span class="c1">$14.40</span></p></td></tr><tr class="c12"><td class="c6" colspan="1" rowspan="1"><p class="c0"><span class="c1">1</span></p></td><td class="c8" colspan="1" rowspan="1"><p class="c0"><span class="c1">Branding Strategies in Graphic Design</span></p></td><td class="c7" colspan="1" rowspan="1"><p class="c0"><span class="c1">$20.00</span></p></td><td class="c13" colspan="1" rowspan="1"><p class="c0"><span class="c1">$16.00</span></p></td><td class="c5" colspan="1" rowspan="1"><p class="c0"><span class="c1">$16.00</span></p></td></tr><tr class="c14"><td class="c6" colspan="1" rowspan="1"><p class="c0"><span class="c1">2</span></p></td><td class="c8" colspan="1" rowspan="1"><p class="c0"><span class="c1">Best Practices in Web Design: A European Perspective</span></p></td><td class="c7" colspan="1" rowspan="1"><p class="c0"><span class="c1">$28.00</span></p></td><td class="c13" colspan="1" rowspan="1"><p class="c0"><span class="c1">$22.40</span></p></td><td class="c5" colspan="1" rowspan="1"><p class="c0"><span class="c1">$44.80</span></p></td></tr><tr class="c10"><td class="c6" colspan="1" rowspan="1"><p class="c0 c3"><span class="c1"></span></p></td><td class="c8" colspan="1" rowspan="1"><p class="c0 c3"><span class="c1"></span></p></td><td class="c7" colspan="1" rowspan="1"><p class="c0 c3"><span class="c1"></span></p></td><td class="c13" colspan="1" rowspan="1"><p class="c0"><span class="c1">TOTAL DUE:</span></p></td><td class="c5" colspan="1" rowspan="1"><p class="c0"><span class="c1">$92.80</span></p></td></tr></table><p class="c2 c3"><span class="c1"></span></p><p class="c2 c3"><span class="c1"></span></p><p class="c2 c3"><span class="c1"></span></p><hr><p class="c2 c3"><span class="c1"></span></p><p class="c2"><span class="c1">Attention, Seminar Participants:</span></p><p class="c2"><span class="c1">Unfortunately, we do not have copies of Emilio Costa&#39;s book Branding Strategies in Graphic Design with us today. For those of you who have ordered it, please give your mailing address to the volunteer at the check-in desk, and the book will be mailed to your home at no cost to you. We will charge your credit card upon shipment. We are sorry for the inconvenience.</span></p><p class="c2 c3"><span class="c1"></span></p><hr><p class="c2 c3"><span class="c1"></span></p><p class="c2"><span class="c1">*E-mail*</span></p><p class="c2 c3"><span class="c1"></span></p><p class="c2"><span class="c1">To: roberta.tsu@peltergraphics.com</span></p><p class="c2"><span class="c1">From: joseph.morgan@peltergraphics.com</span></p><p class="c2"><span class="c1">Date: June 22</span></p><p class="c2"><span class="c1">Sent: Costa book</span></p><p class="c2"><span class="c1">Dear Roberta,</span></p><p class="c2 c3"><span class="c1"></span></p><p class="c2"><span class="c1">I&#39;m looking forward to finishing up our brochure design for Entchen Financial Consultants. Before we submit our final draft, I would like to rethink how we are presenting our data. Have you had a chance to look through the Costa book I showed you? He gives great advice on improving the clarity of financial information in marketing materials. Anyway, let&#39;s talk about it at lunch tomorrow.</span></p><p class="c2 c3"><span class="c1"></span></p><p class="c2"><span class="c1">Best,</span></p><p class="c2"><span class="c1">Joseph</span></p><p class="c2 c3"><span class="c1"></span></p></body></html>
                      """;

class HtmlPanel extends StatelessWidget {
  final String htmlText;
  const HtmlPanel({
    super.key,
    required this.htmlText,
  });

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      child: Html(
        data: htmlText,
        customRender: {
          "table": (context, child) {
            return Container(
              color: Colors.grey.withOpacity(0.2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    child:
                        (context.tree as TableLayoutElement).toWidget(context),
                  ),
                ],
              ),
            );
          }
        },
        style: {
          "*": Style(
            margin: const EdgeInsets.all(0),
            padding: const EdgeInsets.all(0),
            fontSize: FontSize(context.bodyLarge!.fontSize),
            fontFamily: context.bodyLarge!.fontFamily,
            color: context.bodyLarge!.color,
          ),
          "td": Style(
            padding: EdgeInsets.all(6.sp),
            alignment: Alignment.topLeft,
            border: Border.all(color: Colors.grey),
          ),
          "hr": Style(
            border: Border.all(color: Colors.grey),
          ),
          // "th": Style(
          //   padding: EdgeInsets.all(6),
          //   backgroundColor: Colors.grey,
          // ),
          // "td": Style(
          //   padding: EdgeInsets.all(2),
          //   alignment: Alignment.topLeft,
          // ),
          // "table": Style(
          //   s
          // ),
        },
      ),
    );
  }
}
