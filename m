Return-Path: tbskyd@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 25f8a3a9
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 06:16:17 +0000 (UTC)
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e04ea18
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Nov 2017 06:16:17 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id g130so230387wme.0
 for <wireguard@lists.zx2c4.com>; Wed, 29 Nov 2017 22:22:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAC6SzHJJvFUkY-+DWXBP3D86KXtEv0U+vY4VN3ce0v=Fpk4T4g@mail.gmail.com>
References: <CAC6SzH+Q-1SRVXOoScGhXWraOLdp9_Rud6cMbQ95a51r=eRWTw@mail.gmail.com>
 <CAHmME9piZhSukf55XY1Un2hO0TZyfHRh+afU8kk6R6yoSA5pQA@mail.gmail.com>
 <CAC6SzHJZj5BOMek4i=1ykepHSzHRDGKYTj-Cfa4veRbsVuj2WA@mail.gmail.com>
 <CAHmME9qeUw5VsaEoAG=i0=5LfOq4aPGi2KjDHKDjAPorXKJgbA@mail.gmail.com>
 <CAC6SzHJd8DzMBhuoGG=c8gtKzKd1zFs6wndKF0mEZDQW0aB6aQ@mail.gmail.com>
 <20171129135124.GA29970@zx2c4.com>
 <CAC6SzH+yoUtuim6oHypPXmef-oh2rQZTdQXDuN5YAGteXHN7rQ@mail.gmail.com>
 <CAHmME9pjU_5AncEkqYbnSUtB-h5h1nhrD5FXgkBia-sj=8jKrA@mail.gmail.com>
 <CAC6SzHJ8Rd3G7KWng5JxhXV4k2OE+uf5XKQNF3k6bzsDP=wUWA@mail.gmail.com>
 <CAHmME9rquEO5r0cMpTgPsLW790QqbN9DLxuETm-6TfxX9ULsVg@mail.gmail.com>
 <CAC6SzHJJvFUkY-+DWXBP3D86KXtEv0U+vY4VN3ce0v=Fpk4T4g@mail.gmail.com>
From: d tbsky <tbskyd@gmail.com>
Date: Thu, 30 Nov 2017 14:22:22 +0800
Message-ID: <CAC6SzH+AmT2zfnXBznmY=wMyO7EyHF9DD8BX=2Vpm-qKWnuGzA@mail.gmail.com>
Subject: Re: multi-home difficulty
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/mixed; boundary="94eb2c0d45206aa27f055f2d4673"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c0d45206aa27f055f2d4673
Content-Type: text/plain; charset="UTF-8"

2017-11-30 14:15 GMT+08:00 d tbsky <tbskyd@gmail.com>:
> 2017-11-29 22:49 GMT+08:00 Jason A. Donenfeld <Jason@zx2c4.com>:
>> On Wed, Nov 29, 2017 at 3:16 PM, d tbsky <tbskyd@gmail.com> wrote:
>>>      sorry I misunderstand you. you mean I modify the script and run
>>> in my environment to reveal the problem?
>>> ok I will try to do it.
>>
>> Take what I sent you. Run it. If it breaks, send me the output and
>> your kernel. If it doesn't break, mess with it until it breaks, and
>> then send it back to me.
>
> Hi jason:
>
>  "uname -a" result:
>
>  Linux localhost.localdomain 3.10.0-693.5.2.el7.x86_64 #1 SMP Thu Oct
> 19 10:13:14 CDT 2017 x86_64 x86_64 x86_64 GNU/Linux
>
>  your original script runs fine under my environment.
>  I add  three 3 lines before "ip1 link add veth1"  to reveal the problem:
>
> ip1 link add dummy0 type dummy
> ip1 addr add 10.0.0.10/24 dev dummy0
> ip1 link set dummy0 up
>

sorry my fault. incorrect copy paste to email break the script. script
as attachment.

Regards,
tbskyd

--94eb2c0d45206aa27f055f2d4673
Content-Type: application/x-sh; name="final.sh"
Content-Disposition: attachment; filename="final.sh"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_jam3er9f0

IyEvYmluL2Jhc2gKc2V0IC1lCgpleGVjIDM+JjEKZXhwb3J0IFdHX0hJREVfS0VZUz1uZXZlcgpu
ZXRuczE9IndnLXRlc3QtJCQtMSIKbmV0bnMyPSJ3Zy10ZXN0LSQkLTIiCnByZXR0eSgpIHsgZWNo
byAtZSAiXHgxYlszMm1ceDFiWzFtWytdICR7MTorTlMkMTogfSR7Mn1ceDFiWzBtIiA+JjM7IH0K
cHAoKSB7IHByZXR0eSAiIiAiJCoiOyAiJEAiOyB9Cm1heWJlX2V4ZWMoKSB7IGlmIFtbICRCQVNI
UElEIC1lcSAkJCBdXTsgdGhlbiAiJEAiOyBlbHNlIGV4ZWMgIiRAIjsgZmk7IH0KbjEoKSB7IHBy
ZXR0eSAxICIkKiI7IG1heWJlX2V4ZWMgaXAgbmV0bnMgZXhlYyAkbmV0bnMxICIkQCI7IH0KbjIo
KSB7IHByZXR0eSAyICIkKiI7IG1heWJlX2V4ZWMgaXAgbmV0bnMgZXhlYyAkbmV0bnMyICIkQCI7
IH0KaXAxKCkgeyBwcmV0dHkgMSAiaXAgJCoiOyBpcCAtbiAkbmV0bnMxICIkQCI7IH0KaXAyKCkg
eyBwcmV0dHkgMiAiaXAgJCoiOyBpcCAtbiAkbmV0bnMyICIkQCI7IH0Kc2xlZXAoKSB7IHJlYWQg
LXQgIiQxIiAtTiAwIHx8IHRydWU7IH0Kd2FpdGlmYWNlKCkgeyBwcmV0dHkgIiR7MS8vKi19IiAi
d2FpdCBmb3IgJDIgdG8gY29tZSB1cCI7IGlwIG5ldG5zIGV4ZWMgIiQxIiBiYXNoIC1jICJ3aGls
ZSBbWyBcJCg8IFwiL3N5cy9jbGFzcy9uZXQvJDIvb3BlcnN0YXRlXCIpICE9IHVwIF1dOyBkbyBy
ZWFkIC10IC4xIC1OIDAgfHwgdHJ1ZTsgZG9uZTsiOyB9CgpjbGVhbnVwKCkgewogICAgICAgIHNl
dCArZQogICAgICAgIGV4ZWMgMj4vZGV2L251bGwKICAgICAgICBpcDEgbGluayBkZWwgZGV2IHdn
MAogICAgICAgIGlwMiBsaW5rIGRlbCBkZXYgd2cwCiAgICAgICAgbG9jYWwgdG9fa2lsbD0iJChp
cCBuZXRucyBwaWRzICRuZXRuczEpICQoaXAgbmV0bnMgcGlkcyAkbmV0bnMyKSIKICAgICAgICBb
WyAtbiAkdG9fa2lsbCBdXSAmJiBraWxsICR0b19raWxsCiAgICAgICAgcHAgaXAgbmV0bnMgZGVs
ICRuZXRuczEKICAgICAgICBwcCBpcCBuZXRucyBkZWwgJG5ldG5zMgogICAgICAgIGV4aXQKfQoK
dHJhcCBjbGVhbnVwIEVYSVQKCmlwIG5ldG5zIGRlbCAkbmV0bnMxIDI+L2Rldi9udWxsIHx8IHRy
dWUKaXAgbmV0bnMgZGVsICRuZXRuczIgMj4vZGV2L251bGwgfHwgdHJ1ZQpwcCBpcCBuZXRucyBh
ZGQgJG5ldG5zMQpwcCBpcCBuZXRucyBhZGQgJG5ldG5zMgoKa2V5MT0iJChwcCB3ZyBnZW5rZXkp
IgprZXkyPSIkKHBwIHdnIGdlbmtleSkiCnB1YjE9IiQocHAgd2cgcHVia2V5IDw8PCIka2V5MSIp
IgpwdWIyPSIkKHBwIHdnIHB1YmtleSA8PDwiJGtleTIiKSIKcHNrPSIkKHBwIHdnIGdlbnBzayki
CltbIC1uICRrZXkxICYmIC1uICRrZXkyICYmIC1uICRwc2sgXV0KCmNvbmZpZ3VyZV9wZWVycygp
IHsKICAgICAgICBpcDEgYWRkciBhZGQgMTkyLjE2OC4yNDEuMS8yNCBkZXYgd2cwCiAgICAgICAg
aXAyIGFkZHIgYWRkIDE5Mi4xNjguMjQxLjIvMjQgZGV2IHdnMAoKICAgICAgICBuMSB3ZyBzZXQg
d2cwIFwKICAgICAgICAgICAgICAgIHByaXZhdGUta2V5IDwoZWNobyAiJGtleTEiKSBcCiAgICAg
ICAgICAgICAgICBsaXN0ZW4tcG9ydCAxIFwKICAgICAgICAgICAgICAgIHBlZXIgIiRwdWIyIiBc
CiAgICAgICAgICAgICAgICAgICAgICAgIHByZXNoYXJlZC1rZXkgPChlY2hvICIkcHNrIikgXAog
ICAgICAgICAgICAgICAgICAgICAgICBhbGxvd2VkLWlwcyAxOTIuMTY4LjI0MS4yLzMyLGZkMDA6
OjIvMTI4CiAgICAgICAgbjIgd2cgc2V0IHdnMCBcCiAgICAgICAgICAgICAgICBwcml2YXRlLWtl
eSA8KGVjaG8gIiRrZXkyIikgXAogICAgICAgICAgICAgICAgbGlzdGVuLXBvcnQgMiBcCiAgICAg
ICAgICAgICAgICBwZWVyICIkcHViMSIgXAogICAgICAgICAgICAgICAgICAgICAgICBwcmVzaGFy
ZWQta2V5IDwoZWNobyAiJHBzayIpIFwKICAgICAgICAgICAgICAgICAgICAgICAgYWxsb3dlZC1p
cHMgMTkyLjE2OC4yNDEuMS8zMixmZDAwOjoxLzEyOAoKICAgICAgICBpcDEgbGluayBzZXQgdXAg
ZGV2IHdnMAogICAgICAgIGlwMiBsaW5rIHNldCB1cCBkZXYgd2cwCn0KCm4xIGJhc2ggLWMgJ2Vj
aG8gMSA+IC9wcm9jL3N5cy9uZXQvaXB2Ni9jb25mL2FsbC9kaXNhYmxlX2lwdjYnCm4yIGJhc2gg
LWMgJ2VjaG8gMSA+IC9wcm9jL3N5cy9uZXQvaXB2Ni9jb25mL2FsbC9kaXNhYmxlX2lwdjYnCm4x
IGJhc2ggLWMgJ2VjaG8gMSA+IC9wcm9jL3N5cy9uZXQvaXB2Ni9jb25mL2RlZmF1bHQvZGlzYWJs
ZV9pcHY2JwpuMiBiYXNoIC1jICdlY2hvIDEgPiAvcHJvYy9zeXMvbmV0L2lwdjYvY29uZi9kZWZh
dWx0L2Rpc2FibGVfaXB2NicKCmlwMSBsaW5rIGFkZCBkZXYgd2cwIHR5cGUgd2lyZWd1YXJkCmlw
MiBsaW5rIGFkZCBkZXYgd2cwIHR5cGUgd2lyZWd1YXJkCmNvbmZpZ3VyZV9wZWVycwoKaXAxIGxp
bmsgYWRkIGR1bW15MCB0eXBlIGR1bW15CmlwMSBhZGRyIGFkZCAxMC4wLjAuMTAvMjQgZGV2IGR1
bW15MAppcDEgbGluayBzZXQgZHVtbXkwIHVwCgppcDEgbGluayBhZGQgdmV0aDEgdHlwZSB2ZXRo
IHBlZXIgbmFtZSB2ZXRoMgppcDEgbGluayBzZXQgdmV0aDIgbmV0bnMgJG5ldG5zMgoKaXAxIGFk
ZHIgYWRkIDEwLjAuMC4xLzI0IGRldiB2ZXRoMQppcDEgYWRkciBhZGQgMTAuMC4wLjIvMjQgZGV2
IHZldGgxCmlwMiBhZGRyIGFkZCAxMC4wLjAuMy8yNCBkZXYgdmV0aDIKCmlwMSBsaW5rIHNldCB2
ZXRoMSB1cAppcDIgbGluayBzZXQgdmV0aDIgdXAKd2FpdGlmYWNlICRuZXRuczEgdmV0aDEKd2Fp
dGlmYWNlICRuZXRuczIgdmV0aDIKCm4xIGlwdGFibGVzIC1BIElOUFVUIC1tIGNvbm50cmFjayAt
LWN0c3RhdGUgRVNUQUJMSVNIRUQsUkVMQVRFRCAtaiBBQ0NFUFQKbjIgaXB0YWJsZXMgLUEgSU5Q
VVQgLW0gY29ubnRyYWNrIC0tY3RzdGF0ZSBFU1RBQkxJU0hFRCxSRUxBVEVEIC1qIEFDQ0VQVAoK
bjIgd2cgc2V0IHdnMCBwZWVyICIkcHViMSIgZW5kcG9pbnQgMTAuMC4wLjE6MQpuMiBwaW5nIC1X
IDEgLWMgNSAtZiAxOTIuMTY4LjI0MS4xCltbICQobjIgd2cgc2hvdyB3ZzAgZW5kcG9pbnRzKSA9
PSAiJHB1YjEgICAgICAgIDEwLjAuMC4xOjEiIF1dCgpuMSBjb25udHJhY2sgLUwKbjIgY29ubnRy
YWNrIC1MCgpuMiB3ZyBzZXQgd2cwIHBlZXIgIiRwdWIxIiBlbmRwb2ludCAxMC4wLjAuMjoxCm4y
IHBpbmcgLVcgMSAtYyA1IC1mIDE5Mi4xNjguMjQxLjEKW1sgJChuMiB3ZyBzaG93IHdnMCBlbmRw
b2ludHMpID09ICIkcHViMSAgICAgICAgMTAuMC4wLjI6MSIgXV0KCm4xIGNvbm50cmFjayAtTApu
MiBjb25udHJhY2sgLUwK
--94eb2c0d45206aa27f055f2d4673--
