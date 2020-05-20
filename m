Return-Path: <SRS0=qtc0=7C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FORGED_YAHOO_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4126C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 May 2020 17:27:55 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A8AE20899
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 May 2020 17:27:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="BNHjTyUq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A8AE20899
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 213eedb8;
	Wed, 20 May 2020 17:13:07 +0000 (UTC)
Received: from sonic301-22.consmr.mail.gq1.yahoo.com
 (sonic301-22.consmr.mail.gq1.yahoo.com [98.137.64.148])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 783739c9
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 May 2020 17:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1589995655; bh=XuE32FsVhEe24E2TElSGv7qJIbvojVML++eSgKxcWMM=;
 h=Date:From:To:Subject:References:From:Subject;
 b=BNHjTyUqKTAruJ9rfB8vbmJ0vtk+53nMPIDdAg0AYFIqBe1e8c6V89mB3tk/YJpbH0gneLItQGFNOFOPFHeUL0hoFTW+zueFELoJCNeQeAUYqoaeFlf8AtqUEN1UV/uzYP29L9hD8Vq6Y7uTN+0CS42erMbAxdlYFWIWfQhmKj45660q+NXK6JFOXEEpTLTdYe3qeaRgdViCGCZRnFkTmyu0vqOi6QthZYyFKJmzSF/KfX9HqBN2Nq2SNVv+tGhASTX4xYb89SlW66fw2xclGkw5m0gMbAq8EibwNXqrlB9DtUsxt2GxWNw7wHxx05v6viP84GTtOqkHeQ9tdvFQQA==
X-YMail-OSG: DXtMar0VM1lDCFUe7.QPTKIvKO.1IFoR3TS156Gi0OGHQJkvlTr66mPKFOY6WuW
 ar7s2uzW6izOqARqsejfSlYidQd1w.V9kPK0pfP7mxr3rD.p1tOTx89rNTUgFsBigJgG.9aXUDEQ
 67487Ja1.ot.dm6ngRmlkQ.z6y72Ugim7TLbNT.7UDIYnpXN01jbxweGKRyA3C8VPcb33MrqdW7M
 RITJiRmvOyONroux73YRfpKV4mccwSEzhk7SFK8Jxe_fWKlyfxuDXhJcH538.cZC8JFAMP6ijMQU
 2ogXdRoGmNJvtmAP0WK.IE5UxGhLpd5Fval9qgWPGW9E5UPuMtih8EYYUcEw0XiF4UwbDFAH1IoG
 4yaU4Wpn9efJPZ0wk.qSWfK2L8N3werbZz47KWXBfnI_UdQoZyDa7VpsIXGVkvrZxoE.NqasTKKl
 DQsjyx5raHLlZFLYkg5OZrr6lavRHgFP5o2PphRKfxjjicSr9xgRXZnlApl0M.Su_Z_sM587uVEh
 H8Q19rtw9y2FGTzGKegjs2w9fgim1eZ55sePXECkXeAh1pdALPkOr5q7c31I7Yx_AgCqeMYQuvtD
 EckvZRG3vpBqh_TERJqrIG6iVx.axo74U5LGf8_7bHciy6YHrpurSr4Lrh.qnncqKIU3ps455oLI
 O5cEXo82m1iqr0EFdwT6870Vp66c7HNumP_1birwxWQYYncp_QU7.hUj97uF7zeTDlK2hSqCzmdB
 6.6etZR6fWthgt1L7SanKs_TmgIRj7fLoxhFtq4m7mOlPAFpRDq5zORZ9mrmSwx_KDB8I.ox2Ijn
 5hMv4TSorC1mjEfe4VXkm_mQJn5BzgGFkXIs1s8A.UwkAl4_L1FauxQMA_CQOaSS9UmanlGanxO9
 _0aLLt_o2fLYGNUR8pVL3Lm.kCdzKgO66CSQlwrF27CIjKe69iNAY182npXwW85VPA7H5jSj22zu
 B6L6RIkWxB2WRFXOYCr8ASxCYz1t9tTw9gKW8YS3bS.WPRjVV840GYYWHQQZFqld0TPu36wPNIg1
 CdJesmMWKXMItXNVzRjWpPmQYezK0jhL.5NGUt.5MXUxmPBME.xxtVApoKJNMTB4GOSpJe32GLTh
 Aki9vEvaWiwgK2IWuE.1SvDuly22pfgObjn6TS9cJHRMIxV8e2lkMaMnwCsN9iblMnoWzItEMqpT
 WESTuSU.GuG_zpyj2Gxs8wPcifx4r5YcQQFDksU0JfQvtW2CNQ7BUTiJhyjDRlNJbRusx1r9YzXu
 Y2CFtnB3OA1bktTYhRXBb0JTbpn7vdU18q_tBC2Y007igVXoOPhTjkOll
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.gq1.yahoo.com with HTTP; Wed, 20 May 2020 17:27:35 +0000
Date: Wed, 20 May 2020 17:27:31 +0000 (UTC)
From: Jose Marinez <jedi_papi@yahoo.com>
To: WireGuard Mailing List <wireguard@lists.zx2c4.com>
Message-ID: <1587211445.2302354.1589995651547@mail.yahoo.com>
Subject: Shouldn't devices tethered to a device using Wireguard share the
 same IP?
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
References: <1587211445.2302354.1589995651547.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.15960 YMailNorrin Mozilla/5.0 (Macintosh;
 Intel Mac OS X 10_13_6) AppleWebKit/605.1.15 (KHTML, like Gecko)
 Version/13.1 Safari/605.1.15
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi Guys,

Can you tell me if this is working as it should?...

I have a phone with Wireguard on. I share the connection via tethering/hots=
pot. When I check the IP on the tethered device I don't see the same IP as =
my Wireguard endpoint. What I do see is an IP from the phone's mobile=C2=A0=
network, the one running Wireguard.=C2=A0

Is this right? Does this=C2=A0mean that traffic from that tethered device n=
ot using the Wireguard connection? I'm confused.


Thanks,
Jose
