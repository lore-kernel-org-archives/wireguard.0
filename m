Return-Path: jan.delandtsheer@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f099124
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 20:38:51 +0000 (UTC)
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
 [209.85.218.42])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 035c1350
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Aug 2017 20:38:51 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id g131so17956279oic.3
 for <wireguard@lists.zx2c4.com>; Thu, 10 Aug 2017 14:00:59 -0700 (PDT)
MIME-Version: 1.0
References: <CADqnr01+qq8K+083_LRJeq424BHB_F+R-nxoGdrWAPCuS1r=gA@mail.gmail.com>
 <CAHmME9pMAMC4DY6PXTB_y64O6O2O6JVQY8ks=c=co+gDFYMHqA@mail.gmail.com>
 <CADqnr00euKzi7R44JSTktKCbooodU5Y1sko6wP9b8bpf4SLFbg@mail.gmail.com>
 <CAHmME9q8hNh8tfqruwyYfb0G0qZgdHN53p2NVzpG8QZcx++z8Q@mail.gmail.com>
 <CABQfmN1fviFhgp1bw82_A9RnZrokch+PmwLZCUMZm=F_doxc5g@mail.gmail.com>
 <CABQfmN3EFBL-w3KwLJQMa3HB7_FTrFEFXyQyeJqDtM4yg4DW4Q@mail.gmail.com>
 <CAHmME9qNUzNqPQK-csdRou3Ndy5rqsugdMQ132_uADNOhmMeuw@mail.gmail.com>
 <CABQfmN3uYPrhMzUOvQ9cphXVN3WwNE8YAXdyrTa_cYtfr=9BLA@mail.gmail.com>
In-Reply-To: <CABQfmN3uYPrhMzUOvQ9cphXVN3WwNE8YAXdyrTa_cYtfr=9BLA@mail.gmail.com>
From: Jan De Landtsheer <jan.delandtsheer@gmail.com>
Date: Thu, 10 Aug 2017 21:00:47 +0000
Message-ID: <CABQfmN0ULhDZ5vgrdgiQMy83Lt0Lze4bB3e08araPFtreW=oOQ@mail.gmail.com>
Subject: Re: FR: interface ListenAddress (Aka:Multihomed server issue)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="001a113bf9e84518b605566c7e33"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Jan De Landtsheer <jan@delandtsheer.eu>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113bf9e84518b605566c7e33
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

seeing the latest & greatest, this patch will not apply cleanly, so I don't
know ... is this train of thought going to be kept for later releases ?

On Thu, Aug 10, 2017 at 10:50 PM Jan De Landtsheer <
jan.delandtsheer@gmail.com> wrote:

> TCP connections work all right, as they=E2=80=99re established sockets, w=
here the
> kernel does the routing=E2=80=A6 I assumed you would search for the route=
 yourself
> ;-)
> rcu_dereference_bh(rt->dst.dev->ip_ptr) indeed does , as the packet
> effectively comes in through the uplink.
>
> In the firewall config I need to specify both interfaces (Uplink and
> Public (eth1 and eth0 in the drawing) to filter
>
> nft add rule ip filter input iif {Uplink,Public} jump public and define
> my rules in the public chain
> nft add rule ip filter public ip daddr 134.56.78.5 udp dport 443 accept
> so a packet coming in on Uplink for the wg gets accepted only if the dst =
ip
> matches.
>
> nftables FTW ;-)
>
> That in se is not very important if you have only one uplink, but if you
> have multiple routes (default gw=E2=80=99s) you really need the ip behind=
 the
> uplinks.
>
> But anyway, tested and confirmed to work now,
>
> Many thanks for the quick reply
> =E2=80=8B
>
> On Thu, Aug 10, 2017 at 9:46 PM Jason A. Donenfeld <Jason@zx2c4.com>
> wrote:
>
>> Hi Jan,
>>
>> Thanks for the drawing. So the issue is that you want packets to exit
>> through eth1 using the addresses of eth0. I believe applying this
>> patch should enable that: http://ix.io/z3d Can you apply that and let
>> me know if it works?
>>
>> I'm curious: do TCP connections generally work correctly with your
>> configuration?
>>
>> Jason
>>
>

--001a113bf9e84518b605566c7e33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">seeing the latest &amp; greatest, this patch will not appl=
y cleanly, so I don&#39;t know ... is this train of thought going to be kep=
t for later releases ?</div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
>On Thu, Aug 10, 2017 at 10:50 PM Jan De Landtsheer &lt;<a href=3D"mailto:j=
an.delandtsheer@gmail.com">jan.delandtsheer@gmail.com</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"m_28734602=
13616699503markdown-here-wrapper"><p style=3D"margin:0px 0px 1.2em!importan=
t">TCP connections work all right, as they=E2=80=99re established sockets, =
where the kernel does the routing=E2=80=A6 I assumed you would search for t=
he route yourself ;-)<br><code style=3D"font-size:0.85em;font-family:Consol=
as,Inconsolata,Courier,monospace;margin:0px 0.15em;padding:0px 0.3em;white-=
space:pre-wrap;border:1px solid rgb(234,234,234);background-color:rgb(248,2=
48,248);border-radius:3px;display:inline">rcu_dereference_bh(rt-&gt;dst.dev=
-&gt;ip_ptr)</code> indeed does , as the packet effectively comes in throug=
h the uplink.</p>
<p style=3D"margin:0px 0px 1.2em!important">In the firewall config I need t=
o specify both interfaces (Uplink and Public (eth1 and eth0 in the drawing)=
 to filter</p>
<p style=3D"margin:0px 0px 1.2em!important"><code style=3D"font-size:0.85em=
;font-family:Consolas,Inconsolata,Courier,monospace;margin:0px 0.15em;paddi=
ng:0px 0.3em;white-space:pre-wrap;border:1px solid rgb(234,234,234);backgro=
und-color:rgb(248,248,248);border-radius:3px;display:inline">nft add rule i=
p filter input iif {Uplink,Public} jump public</code> and define my rules i=
n the public chain<br><code style=3D"font-size:0.85em;font-family:Consolas,=
Inconsolata,Courier,monospace;margin:0px 0.15em;padding:0px 0.3em;white-spa=
ce:pre-wrap;border:1px solid rgb(234,234,234);background-color:rgb(248,248,=
248);border-radius:3px;display:inline">nft add rule ip filter public ip dad=
dr 134.56.78.5 udp dport 443 accept</code> so a packet coming in on Uplink =
for the wg gets accepted only if the dst ip matches.</p><p style=3D"margin:=
0px 0px 1.2em!important">nftables FTW ;-)</p>
<p style=3D"margin:0px 0px 1.2em!important">That in se is not very importan=
t if you have only one uplink, but if you have multiple routes (default gw=
=E2=80=99s)  you really need the ip behind the uplinks.</p><p style=3D"marg=
in:0px 0px 1.2em!important">But anyway, tested and confirmed to work now,=
=C2=A0</p><p style=3D"margin:0px 0px 1.2em!important">Many thanks for the q=
uick reply</p>
<div title=3D"MDH:VENQIGNvbm5lY3Rpb25zIHdvcmsgYWxsIHJpZ2h0LCBhcyB0aGV5J3JlI=
GVzdGFibGlzaGVkIHNv
Y2tldHMsIHdoZXJlIHRoZSBrZXJuZWwgZG9lcyB0aGUgcm91dGluZy4uLiBJIGFzc3VtZWQgeW9=
1
IHdvdWxkIHNlYXJjaCBmb3IgdGhlIHJvdXRlIHlvdXJzZWxmIDstKcKgPGRpdj5gcmN1X2RlcmV=
m
ZXJlbmNlX2JoKHJ0LSZndDtkc3QuZGV2LSZndDtpcF9wdHIpYCBpbmRlZWQgZG9lcyAsIGFzIHR=
o
ZSBwYWNrZXQgZWZmZWN0aXZlbHkgY29tZXMgaW4gdGhyb3VnaCB0aGUgdXBsaW5rLjwvZGl2Pjx=
k
aXY+PGJyPjwvZGl2PjxkaXY+SW4gdGhlIGZpcmV3YWxsIGNvbmZpZyBJIG5lZWQgdG8gc3BlY2l=
m
eSBib3RoIGludGVyZmFjZXMgKFVwbGluayBhbmQgUHVibGljIChldGgxIGFuZCBldGgwIGluIHR=
o
ZSBkcmF3aW5nKSB0byBmaWx0ZXI8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PmBuZnQgYWRkIHJ=
1
bGUgaXAgZmlsdGVyIGlucHV0IGlpZiB7VXBsaW5rLFB1YmxpY30ganVtcCBwdWJsaWNgIGFuZCB=
k
ZWZpbmUgbXkgcnVsZXMgaW4gdGhlIHB1YmxpYyBjaGFpbiZuYnNwOzwvZGl2PjxkaXY+YGlwIGF=
k
ZHIgMTM0LjU2Ljc4LjUgdWRwIGRwb3J0IDQ0MyBhY2NlcHRgIHNvIGEgcGFja2V0IGNvbWluZyB=
p
biBvbiBVcGxpbmsgZm9yIHRoZSB3ZyBnZXRzIGFjY2VwdGVkIG9ubHkgaWYgdGhlIGRzdCBpcCB=
t
YXRjaGVzLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+VGhhdCBpbiBzZSBpcyBub3QgdmVyeSB=
p
bXBvcnRhbnQgaWYgeW91IGhhdmUgb25seSBvbmUgdXBsaW5rLCBidXQgaWYgeW91IGhhdmUgbXV=
s
dGlwbGUgcm91dGVzIChkZWZhdWx0IGd3J3MpICZuYnNwO3lvdSByZWFsbHkgbmVlZCB0aGUgaXA=
g
YmVoaW5kIHRoZSB1cGxpbmtzLjwvZGl2PjxkaXY+PGJyPjwvZGl2Pg=3D=3D" style=3D"heig=
ht:0;width:0;max-height:0;max-width:0;overflow:hidden;font-size:0em;padding=
:0;margin:0">=E2=80=8B</div></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr">On Thu, Aug 10, 2017 at 9:46 PM Jason A. Donenfeld &lt;<a href=
=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">Hi Jan,<br>
<br>
Thanks for the drawing. So the issue is that you want packets to exit<br>
through eth1 using the addresses of eth0. I believe applying this<br>
patch should enable that: <a href=3D"http://ix.io/z3d" rel=3D"noreferrer" t=
arget=3D"_blank">http://ix.io/z3d</a> Can you apply that and let<br>
me know if it works?<br>
<br>
I&#39;m curious: do TCP connections generally work correctly with your<br>
configuration?<br>
<br>
Jason<br>
</blockquote></div></blockquote></div>

--001a113bf9e84518b605566c7e33--
