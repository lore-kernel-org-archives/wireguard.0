Return-Path: eric@ericlight.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 10712544
 for <wireguard@lists.zx2c4.com>; Sat, 9 Dec 2017 01:02:39 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 01e85852
 for <wireguard@lists.zx2c4.com>; Sat, 9 Dec 2017 01:02:39 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id B53302093D
 for <wireguard@lists.zx2c4.com>; Fri,  8 Dec 2017 20:09:50 -0500 (EST)
Message-Id: <1512781790.2178482.1199106832.50AF586D@webmail.messagingengine.com>
From: Eric Light <eric@ericlight.com>
To: wireguard@lists.zx2c4.com
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="_----------=_151278179021784820"
Subject: Re: [patch] add support for peer names using a file in userspace
Date: Sat, 09 Dec 2017 14:09:50 +1300
References: <4B7E0154-039F-4008-9C47-C825E1474731@lonnie.abelbeck.com>
 <CAHmME9pL8+FQv_oAKCFpnZQ6ew1xmoKk-RQqtDHktWARvDXH_w@mail.gmail.com>
 <705B40D6-4947-4E5A-A042-B0C8A0D5BB84@lonnie.abelbeck.com>
 <CAHmME9rV3simg0dTD7ja-RGWGTSR0dSMgJ20ft1FXPeZyFWamw@mail.gmail.com>
 <BC9DA88D-CB32-434E-AF02-74A862405A5D@lonnie.abelbeck.com>
 <CAHmME9r-Vc20LS=bQeNPH8f4+zMjyVNjYW30zX1+5-8vx5Y4cg@mail.gmail.com>
In-Reply-To: <CAHmME9r-Vc20LS=bQeNPH8f4+zMjyVNjYW30zX1+5-8vx5Y4cg@mail.gmail.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.

--_----------=_151278179021784820
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"

For what it's worth, I agree with Lonnie that *something* is necessary.
That said, I don't feel it makes sense in the context of [Peer-
why_would_this_go_here_its_very_strange].
Having it as an attribute of the peer makes sense to me (e.g.
"Description=")... the name really IS an attribute of a peer.
The question is, is wg(8) the right place to put this?  I think so, but
only by virtue of the fact that I can't think of anywhere more
appropriate to put it.
Hope that feedback is worth at least two cents  :)

--------------------------------------------
Q: Why is this email five sentences or less?
A: http://five.sentenc.es



On Sat, 9 Dec 2017, at 09:39, Jason A. Donenfeld wrote:
> 
> 
> On Dec 8, 2017 14:00, "Lonnie Abelbeck"
> <lists@lonnie.abelbeck.com> wrote:>> 
>> On Dec 8, 2017, at 12:45 PM, Jason A. Donenfeld
>> <Jason@zx2c4.com> wrote:>> 
>> I suggested "no spaces"  since currently all spaces are stripped in
>> config_read_line()> 
> Oh, okay. It's that way mostly out of my own laziness. I wouldn't
> object to making that into a real parser though.> _________________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard


--_----------=_151278179021784820
Content-Transfer-Encoding: 7bit
Content-Type: text/html; charset="utf-8"

<!DOCTYPE html>
<html>
<head>
<title></title>
<style type="text/css">p.MsoNormal,p.MsoNoSpacing{margin:0}</style>
</head>
<body><div>For what it's worth, I agree with Lonnie that *something* is necessary.<br></div>
<div><br></div>
<div>That said, I don't feel it makes sense in the context of [Peer-why_would_this_go_here_its_very_strange].<br></div>
<div><br></div>
<div>Having it as an attribute of the peer makes sense to me (e.g. "Description=")... the name really IS an attribute of a peer.<br></div>
<div><br></div>
<div>The question is, is wg(8) the right place to put this?&nbsp; I think so, but only by virtue of the fact that I can't think of anywhere more appropriate to put it.<br></div>
<div><br></div>
<div>Hope that feedback is worth at least two cents&nbsp; :)</div>
<div><br></div>
<div id="sig66226376"><div class="signature">--------------------------------------------<br></div>
<div class="signature">Q: Why is this email five sentences or less?<br></div>
<div class="signature">A: http://five.sentenc.es<br></div>
<div class="signature"><br></div>
</div>
<div><br></div>
<div><br></div>
<div>On Sat, 9 Dec 2017, at 09:39, Jason A. Donenfeld wrote:<br></div>
<blockquote type="cite"><div><div><div><br></div>
<div><div><br></div>
<div defang_data-gmailquote="yes"><div>On Dec 8, 2017 14:00, "Lonnie Abelbeck" &lt;<a href="mailto:lists@lonnie.abelbeck.com">lists@lonnie.abelbeck.com</a>&gt; wrote:<br></div>
<blockquote style="margin-top:0px;margin-right:0px;margin-bottom:0px;margin-left:0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204, 204, 204);padding-left:1ex;"><div><div><br></div>
<div>On Dec 8, 2017, at 12:45 PM, Jason A. Donenfeld &lt;<a href="mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt; wrote:<br></div>
<div> <br></div>
</div>
<div>I suggested "no spaces"&nbsp; since currently all spaces are stripped in config_read_line()<br></div>
</blockquote></div>
</div>
</div>
<div><br></div>
<div>Oh, okay. It's that way mostly out of my own laziness. I wouldn't object to making that into a real parser though.<br></div>
</div>
<div><u>_______________________________________________</u><br></div>
<div>WireGuard mailing list<br></div>
<div><a href="mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a><br></div>
<div><a href="https://lists.zx2c4.com/mailman/listinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard</a><br></div>
</blockquote><div><br></div>
</body>
</html>

--_----------=_151278179021784820--
