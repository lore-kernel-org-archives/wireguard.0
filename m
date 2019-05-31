Return-Path: <SRS0=T0To=T7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B412C04AB6
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 31 May 2019 07:46:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C7E12652F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 31 May 2019 07:46:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="YdXTXWd8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C7E12652F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=posteo.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3f23f77b;
	Fri, 31 May 2019 07:46:36 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d2ae8e6
 for <wireguard@lists.zx2c4.com>;
 Fri, 31 May 2019 07:46:32 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 60f71a6a
 for <wireguard@lists.zx2c4.com>;
 Fri, 31 May 2019 07:46:32 +0000 (UTC)
Received: from submission (posteo.de [89.146.220.130]) 
 by mout02.posteo.de (Postfix) with ESMTPS id 55A752400E5
 for <wireguard@lists.zx2c4.com>; Fri, 31 May 2019 09:46:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
 t=1559288791; bh=fF8esyjAtMk7oGwBWbX6WEKYj2J48KJjNFY9TX2aw5A=;
 h=To:From:Subject:Openpgp:Autocrypt:Date:From;
 b=YdXTXWd8onoKjYhhsDZBbXe6PbFz9l+vlz/fHK+Z3mnUb4D9lCZ1oi1XbSHTESYLa
 00aBqUM99WfoFwPBU0IqoyqutSlBUuDUfP6lpLu+t65pff7jHs9s/BdbcvOgK0a6sS
 BwSRnLgppXQO1fJC595VeW9wof1QnW0gjiHnfmYhFm2gW7lWtZE+oTnbhlvaxpBRsx
 PovZj9dwVDyNFdS6dw8XmkIsr7w5d/aR+IPPlsPP2rEJNDVQfQVtOP+d+UIlgf6J2b
 K88Hwdj59PN+RG78q3ASzka/Pox7qi98sQ/58VGvfU+PV466RZGj3Axax6/J+2so3B
 9kyRZxFkMUjsw==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 45Fc2t5DWLz9rxS
 for <wireguard@lists.zx2c4.com>; Fri, 31 May 2019 09:46:30 +0200 (CEST)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: Emanuele Bernardi <e.berna@posteo.net>
Subject: debian module install fail
Openpgp: preference=signencrypt
Autocrypt: addr=e.berna@posteo.net; prefer-encrypt=mutual; keydata=
 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
Message-ID: <e7ad6598-4b9d-dde3-749a-a3bbeaeb2159@posteo.net>
Date: Fri, 31 May 2019 09:46:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============2682750392346388924=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

This is a multi-part message in MIME format.
--===============2682750392346388924==
Content-Type: multipart/alternative;
 boundary="------------54CA7EE943CC76F90BCFF277"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------54CA7EE943CC76F90BCFF277
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Hi, i normally compile wireguard in my debian machine. Having to change
my laptop i tried to recompile it and on the make module-install i
get this error:

 INSTALL /home/lele/Downloads/tmp/test/WireGuard/src/wireguard.ko
  DEPMOD  4.19.0-5-amd64
Warning: modules_install: missing 'System.map' file. Skipping depmod.
depmod -a

All the dependencies are installed as listed on the wireguard page.
some suggestions?

Thanks
Emanuele

--------------54CA7EE943CC76F90BCFF277
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <font size="-1"><font face="Liberation Mono">Hi, i normally compile
        wireguard in my debian machine. Having to change my laptop i
        tried to recompile it and on the make module-install i <br>
        get this error: <br>
        <br>
         INSTALL
        /home/lele/Downloads/tmp/test/WireGuard/src/wireguard.ko<br>
          DEPMOD  4.19.0-5-amd64<br>
        Warning: modules_install: missing 'System.map' file. Skipping
        depmod.<br>
        depmod -a<br>
        <br>
        All the dependencies are installed as listed on the wireguard
        page.<br>
        some suggestions?<br>
        <br>
        Thanks<br>
        Emanuele<br>
      </font></font>
  </body>
</html>

--------------54CA7EE943CC76F90BCFF277--

--===============2682750392346388924==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2682750392346388924==--
