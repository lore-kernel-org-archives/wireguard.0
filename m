Return-Path: luci@createc.ro
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1602031a
 for <wireguard@lists.zx2c4.com>; Mon, 4 Sep 2017 20:28:48 +0000 (UTC)
Received: from mail.crimel.ro (mail.crimel.ro [5.2.196.145])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7eb41a80
 for <wireguard@lists.zx2c4.com>; Mon, 4 Sep 2017 20:28:48 +0000 (UTC)
Subject: Re: Module verification failed
To: wireguard@lists.zx2c4.com
References: <1504407150.3783820.1093515456.1E75D390@webmail.messagingengine.com>
From: Lucian Cristian <luci@createc.ro>
Message-ID: <242ba4db-a5f0-d13b-46f6-1246886d17d7@createc.ro>
Date: Mon, 4 Sep 2017 23:54:03 +0300
MIME-Version: 1.0
In-Reply-To: <1504407150.3783820.1093515456.1E75D390@webmail.messagingengine.com>
Content-Type: multipart/alternative;
 boundary="------------93F73612A38825C3C76EA580"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------93F73612A38825C3C76EA580
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03.09.2017 05:52, DANG Fan wrote:
> I built WireGuard from source, and I got "Module verification failed" 
> message when I tried to run "wg-quick up".
>
> Here is what I found in dmesg:
>
> [   55.700967] wireguard: module verification failed: signature and/or 
> required key missing - tainting kernel
> [   55.701390] wireguard: WireGuard 0.0.20170810 loaded. See 
> www.wireguard.com <http://www.wireguard.com> for information.
> [   55.701391] wireguard: Copyright (C) 2015-2017 Jason A. Donenfeld 
> <Jason@zx2c4.com <mailto:Jason@zx2c4.com>>. All Rights Reserved.
>
> ffs@server:~$ uname -a
> Linux server 4.4.0-93-generic #116-Ubuntu SMP Fri Aug 11 21:17:51 UTC 
> 2017 x86_64 x86_64 x86_64 GNU/Linux
>
> Thanks!
>
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

you have to add the driver to kernel sources and build the whole kernel 
to not get this warning, is a new policy from kernel


Regards


--------------93F73612A38825C3C76EA580
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 03.09.2017 05:52, DANG Fan wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:1504407150.3783820.1093515456.1E75D390@webmail.messagingengine.com">
      <title></title>
      <div>I built WireGuard from source, and I got "Module verification
        failed" message when I tried to run "wg-quick up".<br>
      </div>
      <div><br>
      </div>
      <div>Here is what I found in dmesg:<br>
      </div>
      <div><br>
      </div>
      <div>[   55.700967] wireguard: module verification failed:
        signature and/or required key missing - tainting kernel<br>
      </div>
      <div>[   55.701390] wireguard: WireGuard 0.0.20170810 loaded. See
        <a href="http://www.wireguard.com" moz-do-not-send="true">www.wireguard.com</a>
        for information.<br>
      </div>
      <div>[   55.701391] wireguard: Copyright (C) 2015-2017 Jason A.
        Donenfeld &lt;<a href="mailto:Jason@zx2c4.com"
          moz-do-not-send="true">Jason@zx2c4.com</a>&gt;. All Rights
        Reserved.<br>
      </div>
      <div><br>
      </div>
      <div>ffs@server:~$ uname -a<br>
      </div>
      <div>Linux server 4.4.0-93-generic #116-Ubuntu SMP Fri Aug 11
        21:17:51 UTC 2017 x86_64 x86_64 x86_64 GNU/Linux<br>
      </div>
      <div><br>
      </div>
      <div>Thanks!</div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
WireGuard mailing list
<a class="moz-txt-link-abbreviated" href="mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.com</a>
<a class="moz-txt-link-freetext" href="https://lists.zx2c4.com/mailman/listinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard</a>
</pre>
    </blockquote>
    <p>you have to add the driver to kernel sources and build the whole
      kernel to not get this warning, is a new policy from kernel</p>
    <p><br>
    </p>
    <p>Regards<br>
    </p>
  </body>
</html>

--------------93F73612A38825C3C76EA580--
