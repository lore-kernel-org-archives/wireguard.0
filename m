Return-Path: matthias@urlichs.de
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2594c6df
 for <wireguard@lists.zx2c4.com>; Sat, 9 Dec 2017 11:25:56 +0000 (UTC)
Received: from netz.smurf.noris.de (netz.smurf.noris.de [213.95.21.43])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 63ed8854
 for <wireguard@lists.zx2c4.com>; Sat, 9 Dec 2017 11:25:55 +0000 (UTC)
Received: from [2001:780:107:0:1278:d2ff:fea3:d4a6]
 by netz.extern.smurf.noris.de with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <matthias@urlichs.de>) id 1eNdMm-0004Di-Az
 for wireguard@lists.zx2c4.com; Sat, 09 Dec 2017 11:32:26 +0000
Subject: Re: [patch] add support for peer names using a file in userspace
To: wireguard@lists.zx2c4.com
References: <4B7E0154-039F-4008-9C47-C825E1474731@lonnie.abelbeck.com>
 <CAHmME9pL8+FQv_oAKCFpnZQ6ew1xmoKk-RQqtDHktWARvDXH_w@mail.gmail.com>
 <705B40D6-4947-4E5A-A042-B0C8A0D5BB84@lonnie.abelbeck.com>
 <CAHmME9rV3simg0dTD7ja-RGWGTSR0dSMgJ20ft1FXPeZyFWamw@mail.gmail.com>
 <BC9DA88D-CB32-434E-AF02-74A862405A5D@lonnie.abelbeck.com>
 <CAHmME9r-Vc20LS=bQeNPH8f4+zMjyVNjYW30zX1+5-8vx5Y4cg@mail.gmail.com>
 <1512781790.2178482.1199106832.50AF586D@webmail.messagingengine.com>
From: Matthias Urlichs <matthias@urlichs.de>
Message-ID: <0582b73b-d364-5313-0fc0-2249833509df@urlichs.de>
Date: Sat, 9 Dec 2017 12:32:23 +0100
MIME-Version: 1.0
In-Reply-To: <1512781790.2178482.1199106832.50AF586D@webmail.messagingengine.com>
Content-Type: multipart/alternative;
 boundary="------------4CB6B661424C08810878B620"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------4CB6B661424C08810878B620
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 09.12.2017 02:09, Eric Light wrote:
> For what it's worth, I agree with Lonnie that *something* is necessary.
>
> That said, I don't feel it makes sense in the context of
> [Peer-why_would_this_go_here_its_very_strange].
>
Well … I don't care whether it's named [Peer-foo] or [Peer_bar] or [Peer
baz], though the third option is most appealing IMHO.

I do however care a lot about not having multiple [Peer] sections in the
config file. Automated tools like Ansible cannot deal with
identically-tagged sections. This makes auto-updating my wireguard
configuration unnecessarily difficult.

Thus, if "wg showconf" is intended to output something that can be
reused, then the kernel needs to know about the peer's name.

-- 
-- Matthias Urlichs


--------------4CB6B661424C08810878B620
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 09.12.2017 02:09, Eric Light wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:1512781790.2178482.1199106832.50AF586D@webmail.messagingengine.com">
      <title></title>
      <style type="text/css">p.MsoNormal,p.MsoNoSpacing{margin:0}</style>
      <div>For what it's worth, I agree with Lonnie that *something* is
        necessary.<br>
      </div>
      <div><br>
      </div>
      <div>That said, I don't feel it makes sense in the context of
        [Peer-why_would_this_go_here_its_very_strange].<br>
      </div>
      <div><br>
      </div>
    </blockquote>
    Well … I don't care whether it's named [Peer-foo] or [Peer_bar] or
    [Peer baz], though the third option is most appealing IMHO.<br>
    <br>
    I do however care a lot about not having multiple [Peer] sections in
    the config file. Automated tools like Ansible cannot deal with
    identically-tagged sections. This makes auto-updating my wireguard
    configuration unnecessarily difficult.<br>
    <br>
    Thus, if "wg showconf" is intended to output something that can be
    reused, then the kernel needs to know about the peer's name.<br>
    <br>
    <pre class="moz-signature" cols="72">-- 
-- Matthias Urlichs</pre>
  </body>
</html>

--------------4CB6B661424C08810878B620--
