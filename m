Return-Path: <SRS0=ifwh=XT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96DBBC432C1
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Sep 2019 08:57:37 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 344CF2146E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 24 Sep 2019 08:57:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsAfM7qc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 344CF2146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4f30544f;
	Tue, 24 Sep 2019 08:57:00 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 209df17a
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Sep 2019 14:35:42 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0dfd7b1b
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Sep 2019 14:35:42 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id 3so9570195wmi.3
 for <wireguard@lists.zx2c4.com>; Mon, 23 Sep 2019 07:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=JNod1H/AwsqlPAwgSeDea3o53i2lZlae+Jy9dm4cHBM=;
 b=RsAfM7qcaARNEvmPx9f9pNnm3HywbjQQ4vj2vY2CTCBVFz2GTQh6KaDW2cHSaw9fqQ
 7ymFXuhqZn27Qt9TyxqLWb/1TxMwBY4GRk2J9HqVD6VbgP3HRP5RJjnNuIV4/lNe9sLa
 Ilmn2yXLdR4oNinFwF5AkzKvGh+OjLtkxh3+6iYWrIDz7LI9vl7nNTFTZ8YsMbydQ4i+
 ZZcIZA4cJDj1cbS2iqqAgtaqd0Ck3NTrlzW4qksf7V5vjsy5I26C7JujYKNkUrAnZ+bm
 J1aqhbZGSF0wGbtWoLoK9PHTKybcJ9slYwWUtmNZcj5PxeLn3+JgGDU2YavOZZaTWe95
 zN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=JNod1H/AwsqlPAwgSeDea3o53i2lZlae+Jy9dm4cHBM=;
 b=pFluTVB730PRNBQM584GomZP3iCfeIyA8Iqk/r7JNm/+dMYg3di2W41+iQ9/PoPDIy
 NeZKWRuQmVcdz6U5BfPsAItc8GkgP2ayqUo3Ceb+vwtuWQNJfz/q0z8cANCZgw4QVq+G
 aGobt0M5G+xSw/FFb5icut+Ww2Tw+Ff87+HzF+jXwn+Gq2rEH3NSfGZJ0vgtM2Je7lvw
 SrFiiwz+ao+38jO/LKgbhM37TyHCnkVY/YcMCZFDrlM/l128Rjv4sEbpzn2zbDGPZ/EO
 FOBOWAo3RerFWa+1O1hgwQ3tBXLdLIe38D1GyygrAA3K2MoWgBv8eo4tfMuCJbLlq363
 yaGg==
X-Gm-Message-State: APjAAAXa0+6rQBrRG9aX9TLOcuSjoMRWclsI6wDdQxGnmVwb9neVwM24
 C1gI3w3O/rd517D4Lwo2U+iQbP3j0eAsWxYn2dJmLvYFnRo=
X-Google-Smtp-Source: APXvYqziaBmiC7Gt8DKcdqZ4Y7qYoc6pQPGlupdanW/XTz1t7SAQL9GuXfZ3U9Wb3jeX7Duy7jVUK7MLcnvx6dMCF8g=
X-Received: by 2002:a7b:c92d:: with SMTP id h13mr14516816wml.169.1569249340327; 
 Mon, 23 Sep 2019 07:35:40 -0700 (PDT)
MIME-Version: 1.0
From: lord arthas <lordarthas1995@gmail.com>
Date: Mon, 23 Sep 2019 22:35:28 +0800
Message-ID: <CA+Jjfb-JA-knznBY7hJP75JbTewztRA90Mmn-g7j0Lh8uvSidg@mail.gmail.com>
Subject: I can't make a hotspot with Wireguard!
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Tue, 24 Sep 2019 10:56:58 +0200
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
Content-Type: multipart/mixed; boundary="===============7176574624559716323=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7176574624559716323==
Content-Type: multipart/alternative; boundary="0000000000007e894205933955a1"

--0000000000007e894205933955a1
Content-Type: text/plain; charset="UTF-8"

Dear developer:
    I find that I couldn't normally run a hotspot which based on Windows 10
mobile hotspot function when I try sharing internet from Wireguard with
Windows 10's hotspot. My device can't connect with the hotspot which being
shared by Wireguard. I hope you can fix it

--0000000000007e894205933955a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear developer:<div>=C2=A0 =C2=A0 I find that I couldn&#39=
;t normally run a hotspot which based on Windows 10 mobile hotspot function=
 when I try sharing internet from Wireguard with Windows 10&#39;s hotspot. =
My device can&#39;t connect with the hotspot which being shared by Wireguar=
d. I hope you can fix it</div></div>

--0000000000007e894205933955a1--

--===============7176574624559716323==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7176574624559716323==--
