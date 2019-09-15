Return-Path: <SRS0=Wz3S=XK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C27EC4CEC7
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 15 Sep 2019 16:47:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AA35214D8
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 15 Sep 2019 16:47:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=bartschnet.de header.i=@bartschnet.de header.b="pqpoeVsB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AA35214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=bartschnet.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87329892;
	Sun, 15 Sep 2019 16:46:46 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fa76b695
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Sep 2019 16:46:44 +0000 (UTC)
Received: from mail.core-networks.de (mail.core-networks.de
 [IPv6:2001:1bc0:d::4:9])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b870cea
 for <wireguard@lists.zx2c4.com>;
 Sun, 15 Sep 2019 16:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=bartschnet.de; s=2018030201; h=MIME-Version:Date:Message-ID:From:To:Subject
 :content-disposition:content-transfer-encoding;
 bh=RLWcxQXewyzKK8m+PqBZ4dYUQNexKJ85kefrYb3rBYo=; b=pqpoeVsB+l6AEtoSMf1pFiSjfy
 i32SNWorzHVpSyuJnslT+XYe/aBVMZubdhMEF5hEHTnAmXCJv66Ys2Guyc1Bm6vOc0oU5q9MMIWsE
 vzGRBBOSeqsikDOdrHhRL5pRGuCXHAZwcf7dWKkNWLfAF4Fj3cpswvl5HB+fRcjlKm5kcHjm4uAHO
 0Xm3qEx2MWcFQw1IeLn8F6CZr4NJlvsDvrPu4+LzgX+4RHK5q+GfiMCzjZKojz04yhz6RkOlRFJyF
 Sv4FGfeUDLOThTN23+XjK64ZkRldZALKyqErt2I/vrYSpzTg6pKs4dr5RNLJGxPaDzNF5d8HnamYC
 GPo20wXRZ2qJvF3pM0m+n3GWp6BqrgqOyLIPc24MEW178eO3n/zm37AbWkxd1YnFmrCBea9zAAnc3
 3+xmrnkcYav/eSRltn1fGSw6vPqI0cq08BnYmR5OOwUw2G4a1FfiuAC1hPnW5RkjN+SnDTLzErEPz
 JqUxRtScHd1+WXgnoL729ql3K8BzjYA58F+4suupLRc8sny2Rw2so33uCbnsIBye1p8bIO+4vKXWq
 zk6R43wwsTpGWDYl9GSnP9DnlC0ImpM5Kt7Mo+SAj6qja8pkdCYeCDrsBWJUEre8dlTYpIuftmeWH
 Wf8nlMR8JyNYX8ZsRMTXTxfJx5mZKCQl2+a4Z7v6E=;
Received: from localhost (localhost [127.0.0.1])
 by mail.core-networks.de id 1i9Xfb-0005dC-1P
 with ESMTPSA (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 for wireguard@lists.zx2c4.com; Sun, 15 Sep 2019 18:46:41 +0200
Subject: Re: Adding 2FA to WireGuard
To: wireguard@lists.zx2c4.com
References: <CAFsReqSUQYthBTr4o7HQQGdNUgzA33i9hAoJ_UieNUzJbB=hLA@mail.gmail.com>
From: "Rene 'Renne' Bartsch, B.Sc. Informatics" <ml@bartschnet.de>
Message-ID: <1de15e68-20b1-0b36-f3f1-d1182764306a@bartschnet.de>
Date: Sun, 15 Sep 2019 18:46:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFsReqSUQYthBTr4o7HQQGdNUgzA33i9hAoJ_UieNUzJbB=hLA@mail.gmail.com>
Content-Language: en-US
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1677916934139793852=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--===============1677916934139793852==
Content-Type: multipart/alternative;
 boundary="------------0D096ADFC91F21359EEF42E1"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------0D096ADFC91F21359EEF42E1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Rèmi,

I suggested to use use FIDO2/CTAP2 hardware tokens about a week ago.
For in-band signaling I suggest to use OrchidV2 addresses derived from 
the public key (https://www.rfc-editor.org/rfc/pdfrfc/rfc7343.txt.pdf).
That way any peer can calculate the addresses of the other peers from 
their public keys without the need of a lookup table.

Regards,
Renne


Am 12.09.19 um 23:01 schrieb Rémi Lapeyre:
> Hi everybody! We are using WireeGuard on Mac and Linux which works 
> great but for
> compliance purpose, we would like to be able to add an OTP challenge 
> on connection.
>
> I've been looking at the archive of the mailing list and at the 
> various projects
> built around WireGuard and started writing an implementation based on 
> the idea
> from 
> https://lists.zx2c4.com/pipermail/wireguard/2017-September/001741.html:
>
> > Alternatively, you could do OTP in-band, in order to authorize that
> > public key for a certain window of time before inactivity. In this
> > scheme, you'd disallow access to the network segment based on firewall
> > rules until a certain in-band challenge is made -- perhaps by
> > contacting a certain sandboxed server and answering an OTP challenge
> > there
>
> My current implementation (I plan to publish it under MIT license once 
> it's
> ready) has a Python server on the WireGuard server bound to the wg 
> interface
> that add an IPTable rule to allow the traffic for a given amount of 
> time when
> a TOTP is received over TCP. Here are some details
>
>   - The TOTP is bound to the internal tunnel IP address so the IP 
> address that
>   opens the TCP connection is used to identify the user, as thee 
> packet must
>   have been decrypted, it seems to me that there is no way to spoof this.
>
>   - A small text protocol let the user log-in, log-out and read the 
> status of the
>   connection.
>
> The client needs to send the TOTP just after connecting to the server, 
> for which
> I had hoped to use the "PostUp" field of wg-quick.
>
> {Post,Pre}-{Up,Down} seems to be only available on wg-quick for now 
> but we are
> using the wireguard-apple client so I have a few questions:
>
>   1. Is the absence of support {Post,Pre}-{Up,Down} in wireguard-apple on
>   purpose or would a patch to add this welcomed?
>
>   2. Is this way to do the OTP authentication sound?
>
>   3. I've seen that TunSafe has added an extension to the WireGuard 
> protocol so
>   the TOTP auth would not be shared by an attacker that succeded to 
> connect when
>   the user is already connected. This seems like a good idea to do, 
> what are your
>   thougts about this? Would you recommend against my "easier" 
> implementation?
>
>   4. I know that TunSafe was strongly advised against when it was 
> closed-source.
>   Now that it is AGPL code, is it still the case?
>
> One more thing, to simplify the deployment of WireGuard, I would like 
> to propose
> a change in the way the MacOS client import WireGuard configurations 
> from a file.
>
> Our current flow is "Please open the WireGuard app, click on create 
> Tunnel, give
> it a name, paste this configuration underneath what's already written, 
> hit save
> and send us your public key". It gives a lot of oportunity to the user to
> mistype something and make changing the configuration cumbersome 
> ("Edit the
> tunnel, don't touch the `[Interface]` part but replace what's 
> underneath by
> this") so I would like to be able to send to the user a configuration 
> file with
> the PrivateKey missing and have the WireGuard client generate one on 
> the fly but
> this currently gives an error "Interface’s private key is required". Would
> sending a patch for this be welcomed too?
>
>
> Thanks for taking the time to help me, I look forward to contribute to 
> WireGuard :)
>
> Rémi
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

--------------0D096ADFC91F21359EEF42E1
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Hi Rèmi,<br>
    <br>
    I suggested to use use FIDO2/CTAP2 hardware tokens about a week ago.<br>
    For in-band signaling I suggest to use OrchidV2 addresses derived
    from the public key
    (<a class="moz-txt-link-freetext" href="https://www.rfc-editor.org/rfc/pdfrfc/rfc7343.txt.pdf">https://www.rfc-editor.org/rfc/pdfrfc/rfc7343.txt.pdf</a>).<br>
    That way any peer can calculate the addresses of the other peers
    from their public keys without the need of a lookup table.<br>
    <br>
    Regards,<br>
    Renne<br>
    <p><br>
    </p>
    <div class="moz-cite-prefix">Am 12.09.19 um 23:01 schrieb Rémi
      Lapeyre:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAFsReqSUQYthBTr4o7HQQGdNUgzA33i9hAoJ_UieNUzJbB=hLA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <style>body{font-family:Helvetica,Arial;font-size:13px}</style>
      <div style="font-family:Helvetica,Arial;font-size:13px">
        <div style="margin:0px">Hi everybody! We are using WireeGuard on
          Mac and Linux which works great but for </div>
        <div style="margin:0px">compliance purpose, we would like to be
          able to add an OTP challenge on connection.</div>
        <div style="margin:0px"><br>
        </div>
        <div style="margin:0px">I've been looking at the archive of the
          mailing list and at the various projects</div>
        <div style="margin:0px">built around WireGuard and started
          writing an implementation based on the idea</div>
        <div style="margin:0px">from <a
href="https://lists.zx2c4.com/pipermail/wireguard/2017-September/001741.html"
            moz-do-not-send="true">https://lists.zx2c4.com/pipermail/wireguard/2017-September/001741.html</a>:</div>
        <div style="margin:0px"><br>
        </div>
        <div style="margin:0px">&gt; Alternatively, you could do OTP
          in-band, in order to authorize that</div>
        <div style="margin:0px">&gt; public key for a certain window of
          time before inactivity. In this</div>
        <div style="margin:0px">&gt; scheme, you'd disallow access to
          the network segment based on firewall</div>
        <div style="margin:0px">&gt; rules until a certain in-band
          challenge is made -- perhaps by</div>
        <div style="margin:0px">&gt; contacting a certain sandboxed
          server and answering an OTP challenge</div>
        <div style="margin:0px">&gt; there</div>
        <div style="margin:0px"><br>
        </div>
        <div style="margin:0px">My current implementation (I plan to
          publish it under MIT license once it's </div>
        <div style="margin:0px">ready) has a Python server on the
          WireGuard server bound to the wg interface</div>
        <div style="margin:0px">that add an IPTable rule to allow the
          traffic for a given amount of time when</div>
        <div style="margin:0px">a TOTP is received over TCP. Here are
          some details</div>
        <div style="margin:0px"><br>
        </div>
        <div style="margin:0px">  - The TOTP is bound to the internal
          tunnel IP address so the IP address that</div>
        <div style="margin:0px">  opens the TCP connection is used to
          identify the user, as thee packet must </div>
        <div style="margin:0px">  have been decrypted, it seems to me
          that there is no way to spoof this.</div>
        <div style="margin:0px"><br>
        </div>
        <div style="margin:0px">  - A small text protocol let the user
          log-in, log-out and read the status of the </div>
        <div style="margin:0px">  connection.</div>
        <div style="margin:0px"><br>
        </div>
        <div style="margin:0px">The client needs to send the TOTP just
          after connecting to the server, for which</div>
        <div style="margin:0px">I had hoped to use the "PostUp" field of
          wg-quick.</div>
        <div style="margin:0px"><br>
        </div>
        <div style="margin:0px">{Post,Pre}-{Up,Down} seems to be only
          available on wg-quick for now but we are</div>
        <div style="margin:0px">using the wireguard-apple client so I
          have a few questions:</div>
        <div style="margin:0px"><br>
        </div>
        <div style="margin:0px">  1. Is the absence of support
          {Post,Pre}-{Up,Down} in wireguard-apple on</div>
        <div style="margin:0px">  purpose or would a patch to add this
          welcomed?</div>
        <div style="margin:0px"><br>
        </div>
        <div style="margin:0px">  2. Is this way to do the OTP
          authentication sound?</div>
        <div style="margin:0px"><br>
        </div>
        <div style="margin:0px">  3. I've seen that TunSafe has added an
          extension to the WireGuard protocol so</div>
        <div style="margin:0px">  the TOTP auth would not be shared by
          an attacker that succeded to connect when</div>
        <div style="margin:0px">  the user is already connected. This
          seems like a good idea to do, what are your </div>
        <div style="margin:0px">  thougts about this? Would you
          recommend against my "easier" implementation?</div>
        <div style="margin:0px"><br>
        </div>
        <div style="margin:0px">  4. I know that TunSafe was strongly
          advised against when it was closed-source.</div>
        <div style="margin:0px">  Now that it is AGPL code, is it still
          the case?</div>
        <div style="margin:0px"><br>
        </div>
        <div style="margin:0px">One more thing, to simplify the
          deployment of WireGuard, I would like to propose</div>
        <div style="margin:0px">a change in the way the MacOS client
          import WireGuard configurations from a file.</div>
        <div style="margin:0px"><br>
        </div>
        <div style="margin:0px">Our current flow is "Please open the
          WireGuard app, click on create Tunnel, give </div>
        <div style="margin:0px">it a name, paste this configuration
          underneath what's already written, hit save</div>
        <div style="margin:0px">and send us your public key". It gives a
          lot of oportunity to the user to</div>
        <div style="margin:0px">mistype something and make changing the
          configuration cumbersome ("Edit the </div>
        <div style="margin:0px">tunnel, don't touch the `[Interface]`
          part but replace what's underneath by </div>
        <div style="margin:0px">this") so I would like to be able to
          send to the user a configuration file with</div>
        <div style="margin:0px">the PrivateKey missing and have the
          WireGuard client generate one on the fly but</div>
        <div style="margin:0px">this currently gives an error
          "Interface’s private key is required". Would</div>
        <div style="margin:0px">sending a patch for this be welcomed
          too?</div>
        <div style="margin:0px"><br>
        </div>
        <div style="margin:0px"><br>
        </div>
        <div style="margin:0px">Thanks for taking the time to help me, I
          look forward to contribute to WireGuard :)</div>
        <div style="margin:0px"><br>
        </div>
        <div style="margin:0px">Rémi</div>
        <div><br>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
WireGuard mailing list
<a class="moz-txt-link-abbreviated" href="mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a>
<a class="moz-txt-link-freetext" href="https://lists.zx2c4.com/mailman/listinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard</a>
</pre>
    </blockquote>
  </body>
</html>

--------------0D096ADFC91F21359EEF42E1--

--===============1677916934139793852==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1677916934139793852==--
