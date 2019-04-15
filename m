Return-Path: <SRS0=zOjE=TG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D719DC04AAD
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:37:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 732B9206BF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:37:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=yahoo.com.au header.i=@yahoo.com.au header.b="oIRndHkU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 732B9206BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.com.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 823a64df;
	Mon, 6 May 2019 20:31:05 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04473c4e
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Apr 2019 22:16:08 +0000 (UTC)
Received: from sonic313-14.consmr.mail.bf2.yahoo.com
 (sonic313-14.consmr.mail.bf2.yahoo.com [74.6.133.124])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 550e9b7b
 for <wireguard@lists.zx2c4.com>;
 Mon, 15 Apr 2019 22:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com.au; s=s2048;
 t=1555366567; bh=wgM/spf39XXQ/fK4Nd24/t9r6Vd+133UFCsehSMU39k=;
 h=Date:From:To:Subject:References:From:Subject;
 b=oIRndHkU3sq+6BJNLvNKScosLnO7BIdKSZR/JnBje+nHaTxVD09OpQrE9SMMZqd8bQFrjYGHwNsXpgj39b3olZGDWMTYmTEmqZCgPnFOWTLHI9/dNZa8xsydPz91jCRKgdyutZiy2XEmiUH+QKHj2bf96LhRr68k5hKmZ37JTqjuZod1FdvMX5oyLAeW4n4MZmSGSOz3ACbdfOZscN8sYiWVvkjA5HGlqYvdqctgSFsu/E70HpzpdKo50NPetQ700ZHJDjFbAq37p/6yTD2oIisxZNWBhLERGdg7BtC1fNN1CO1xX3qvqVDt6rnfrTAX5zQ3qMC7yjGDNGT9CCBq3Q==
X-YMail-OSG: yI0c8q0VM1nF7Yl98Z4rutUVStnSJ3TFxMZxDnQy1CSYazsl6swrnygy61WjzZO
 _nj1zBw0iceypIVEIxw4Zv5XbwHa6cJA8DEXs3CH2laLWlz3sKdiUARaQNQW20APmTxwY5Medydz
 klOM.ZF_eGrXYPPOZVFNiMn145fVqtuePizegyYViecUS9qlF2.w9rgtHaDPqi00WW1CY19npLjq
 LwDnHQCPuYgtUtt1QGpAcmi7zCuHnBdrCj6ryB6wRHBZaWJKZYFHSq4sIkq25HvKgih52uD.TeRV
 8AOxZWgZBLXU43iL4.Xf37EvTqkt4a0ZZrkAYIjhazLpOtwIvI.V5s3d447ZWACJ3d9h_svvXyQj
 7aghoo9l66JxbnJzANqg7ewnfJ3T2.Lae8HsHClXvQxzD1it2m1SaH7oDQuxEpizxdn01ltV8oIO
 qDEi_PggJJZ.VLpNug6AD_TiplaKdhfNeqaaTMq3mLImecUkXiZWQVpSaYC5Jw_XH7yLx1V32Hmf
 pE.HOq05Ly7YkjwBr1ER3ujH94PWDULvndCvTkC7zqVif3wWXfl1ptw5jk5JEb.xm6BXQWLgXdn.
 pBYAEuPETVTV2ltRyYJs8qsv_kxH1b0liX0guOaiANv.pV0ye87U_W8BSjSDs0DlLLew6eS3UptH
 FvYi36YwsdXhyBGdwZiuYqchY6EGtXNTiQw0v_8kaXE9XstkAWIGL8WFhI369pEKhoCwvxrOH.uL
 UA_L6Z7BR3l_8TrlWgbsS8h0etJlLcHIqI6N3uDAFLFdTK7iSbNwzba.8TSVKaXUl8o._FNtUPPm
 cZwJzXBQuWOknvSfnnHlQxmIY3Q9eBlZk9IUVN0vH7YXiaMHbZx6qbMiWonigiaBs_2B3yAAzjOx
 oESHXf4iXtwRImx3vPEy52gceCsf0DiIDM7yBuiNFevUbHqoiEjpOXLdbQLCv2HUHM5LQn5uEeJJ
 reV.1lrsIHZ7PVBQ19..CXeFYyX71x763.vN1xwGqUQgHsipX4MvVqAGUexuH769y.AmBVbPBrV1
 R9PcAMBD.rVSi7NFvfG7QjwS3sQimyWL1bRSV3pYCEUCU37LF1luvx.AGhG7Cez9GxRKI
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.bf2.yahoo.com with HTTP; Mon, 15 Apr 2019 22:16:07 +0000
Date: Mon, 15 Apr 2019 22:16:05 +0000 (UTC)
From: Ian B <porjo38@yahoo.com.au>
To: WireGuard Mailing List <wireguard@lists.zx2c4.com>
Message-ID: <759244252.3782726.1555366565613@mail.yahoo.com>
Subject: MacOS interface address
MIME-Version: 1.0
References: <759244252.3782726.1555366565613.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.13212 YMailNorrin Mozilla/5.0 (X11; Fedora;
 Linux x86_64; rv:66.0) Gecko/20100101 Firefox/66.0
X-Mailman-Approved-At: Mon, 06 May 2019 22:31:03 +0200
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
Content-Type: multipart/mixed; boundary="===============4270860798885226140=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4270860798885226140==
Content-Type: multipart/alternative; 
	boundary="----=_Part_3782725_1525453778.1555366565612"
Content-Length: 1801

------=_Part_3782725_1525453778.1555366565612
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Using Wireguard app v1.0.1 on Mac OS 10.14, I had some trouble getting it working initially as I had left out the 'Address=' line under '[Interface]'. Coming from Linux where specifying an interface address is optional, it didn't occur to me this would be a problem on Mac.

This raises a couple of questions for me:
- how does it work on Linux, and is leaving out the interface address considered bad practice?
- why doesn't it work on Mac and should the app for Mac be warning the user that the config is incomplete/incorrect ?

Thanks,Ian

------=_Part_3782725_1525453778.1555366565612
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head></head><body><div class="ydpf74e2c32yahoo-style-wrap" style="font-family:Helvetica Neue, Helvetica, Arial, sans-serif;font-size:13px;"><span><div><div><span>Using Wireguard app v1.0.1 on Mac OS 10.14,</span><span> I had some trouble getting it working initially as I had left out the 
'Address=' line under '[Interface]'. Coming from Linux where specifying an interface address is 
optional, it didn't occur to me this would be a problem on Mac.<br></span></div><div><span><br></span></div><div><span>This raises a couple of questions for me:</span></div><div><span><br></span></div><div><span>- how does it work on Linux, and is leaving out the interface address considered bad practice?<br></span></div><div><span>- why doesn't it work on Mac and should the app for Mac be warning the user that the config is incomplete/incorrect ?<br></span></div><div><span><br></span></div></div><span></span>Thanks,<div>Ian</div></span><div><br></div></div></body></html>
------=_Part_3782725_1525453778.1555366565612--

--===============4270860798885226140==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4270860798885226140==--
