Return-Path: <SRS0=89gA=OS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33CB2C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Sep 2021 19:56:16 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 345DC6103E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Sep 2021 19:56:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 345DC6103E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 42de434c;
	Tue, 28 Sep 2021 19:53:47 +0000 (UTC)
Received: from sonic305-2.consmr.mail.bf2.yahoo.com
 (sonic305-2.consmr.mail.bf2.yahoo.com [74.6.133.41])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c83737b7
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Sep 2021 19:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1632858824; bh=zBGYxIfPTBrH/s8ZRl6HFomux29lLO2AFqyNqgrX+zY=;
 h=From:Subject:To:Date:References:From:Subject:Reply-To;
 b=oUWEy8vqnWoV/qfWdtBenVqXF3fsdx1YvDWvDSbqYJeIbAY9thsb8A8fqu+RUq5W9R0Spj0d4Ky9j+W+cncuy78VBMAnN6jHLHhJYGXed4OIKn56Qufi200J8xCw+HhPUN7uDsI21ry+ZAbLDnvD+DqjWh2gBepVP6gBNh1vxQMOAFmGL2pNvUbfVwUXUYs2JvCkqCYawmB5dwVi4l4OvGRz8WYapxQPqpKf4WvR2NYTJDG278BzaaJLEL4JFaDB4usgrBgYd/gmwuzVs71FYcwRJ9BmlBAFWQYVnfgvPGqIr4CTRtbR88zvuXL+jgcUfZx+KmlwLxusXSIbByVZ6A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1632858824; bh=mNtosJj4lmZ2j/7QDNInLvhdx/2+SKYbTcFwJPt3U+N=;
 h=X-Sonic-MF:From:Subject:To:Date:From:Subject;
 b=ce6Qt+yEmzSwS4Df4kIUrts6u6lJ1rBSQl3Qm07Fs39oLObJCIjy9EQdFye3Koc0/mpIDrBh0zR5jUdvWSWG2BRbs4/OX+lyhCB9qqHcQrMw/ztkvjRbxkMOqEFxRc/s5pJ36AzbIhXku1EQM/O+vkM/k58Jtg2wNLzYstYUDC+T/RRNu2SfKM6FDg+7RZHlzlQVzcsOsr2f4CqFj/2gNPdqgBkH/RNq5IWlr+12aUV/q1+WoY4hBjC04TEh2Cw7/W7+PYInpCYoBl4OIcROAwqsD8NJxSFuVE3Jfuxzm+M+m1IS4CCYOQzrYOvX6r+hsf5fEBuBPhWZ+szHw91n1w==
X-YMail-OSG: EIwRBB0VM1nnChOvc7zj26j3P0Z6NlH947fv54IuUMVRi1jQ.w2wb_Rl2A903vo
 cr5vwFDDCZaao7fDP2q0dqDssxXEqTlNysPhCmispZyhFcN9FEERZoA_Bs6U3bWBg8N4PgIVQYbk
 p01jz3j1twEaCnzOu0.oQbY_URFRt5Y02Av1ZvUwjsdLFnnHaaK0cwad66jkPQP09.t6aYadeCL_
 afcyZ4ae13IdFUgh9e0YwKzqY6B5jios3mX3HpFe4eM44iPQo.uIJy7KX2l__hGEoYYnexUs7Ta_
 9mW4JQOUeampukgVlsNQL8KLErThIt6BCt6EstJz4EQiUDfErXvteSk1B8B.URBXu7STwxlTerIV
 KimK_txlVM5ht8tPXxMLTGlko2HTprhAIc3vvYeasP_CAx6jX61c7CITGts_mxfteUiFiEN5y2A.
 WIf4CnoAk0QzHoznnmAKUx1WxBk7A0ELNEyHxnw2rjijV.L6BkaknU2i.mLPJHxkjq7ILCCAiZDK
 orkxU8O_vDXdzwVs1EFI4BXuSrYEDFo5coX8NSqKl4VTgQmXFeLLp2Xyve3zhn8nd7_xbei2L8kX
 pqXxy_iWftSni7AxBmKfbt6q7l..AlmA7qU7gJUeQwJTWUnuemJDuPm0rkoO9vyBCNCZrnJi44bi
 1WOK1xN1rWJqLZL33v8Ymm6lvNBS_rio3rMrE98_rFWeG92.1Q_n9wqVuweIuveozuYi_zDGEWOi
 Na9NTi_6bAVZESXXvCYxDjvDMtWIMBpGMaKHVV0Vr.e3LiLxPJfJql4XgPUUwc7z6tQwFIXAtYuQ
 EnKbI7lqdeY6_gPD1cKCREzdYvALW7aB2gyMSzaby5iqPDR6Wv0Ks82IUQwFgOqW1QRi2uBlVf2x
 hjwfsJdgY5C6ZXMLS8oGeQz8Yc73GgoS0mt1RS8mpYm.AEuSmF7G8sBil.XZuZubD8pAvHhl4_5U
 w9jy9xb.mlaGD82vvHUpZv2oBlHQCUmcutg4PkNEFWeNzJsntR68ISqYiJNwXtiYqfYG5s9g70Ag
 U.XpL0RKVLVnTr_d1PXUzQQBzENJrze.qYofnOCStB9EztjJVxb3pmJFxBJ9jnxZNj0.KtCpaVLB
 qPt9c5xdw7CPpGFuVUuIykhCnMkh3P.8pTv7K5LkgJf_VTDKPHimSIOxuOTcIf_IgfFJc6OVORPD
 J5pSDSngFfTKzhBZ1gYh4QhBjB9w1vMthukMS5QBskUyQ9NZUjVBSN3a1vk0jlhIW_45hfl.3tPq
 YZg07dNGhovD6BvHXfJCpBoHZvhpioCHnjI32EL0892Buv_PE5JpIA8rglQkg7n33m71h97cSaST
 B.gvJKFMOxkpstwF2AyiYJlYAKSTwvJ_xsmCGCWzP.ZkO82YghCJItTppC1CsfyM213Cb6paXmQx
 L8Nvys7FbvhoDdtqhrYVCFqaUOCptGnlAJtp68nZKbHRJ1mYvCfkJxGidro8F7d36l.9UmN60w.Y
 9_gd0Jff5Z8M769iU_OhoftUS6w_x2u1vkxL3h.79D3EZYvnYb3C2gH8TVCnBIg9REk2Q8peZ7eH
 5XGTB31ShREgzOKaGKktbnFW2T2N0VC6Jt6IHSwJKldoQHjXgYrrr.4ghSxDhZXyW1vCqielojjD
 wBHwd.Ddf0tBxOCAlslXKW6OB45e5VYxsEAjTAx6oWmDg6pDUhOs8jhwGIu40eULtWG9mMJp2sXr
 O5QG6a8gZjpwKT.F.lFynWXxq3ZT07UX.FFQaprTujgiaR9bVEZJ1m597vBkifOKVjqHjZD1SyA_
 nGvz2WeI5pp_lmbbMaKHfL2balaq.H0Z6IyeCYtfqpZbg.Ar_rhhWeQgjWxA_j4vVIrrtWfatbbu
 lmBcy0L_40WQb_iLTokmyLXvZ80hVn.9Y7HP7LW_ybgbJ2EeN7oKDNq4GlNyO20hGp8HuypIadRr
 W8hv8JdOJH0PSxBYvjqhd9ws6R33EAIEGBbN5rtHcisC.bD82bCVb2EyCNweg_UmHPYbGb7OQ21_
 IDoUb9fETtxKw9bswJ05nC6U_udYby0IeX20GsEos7HZMlXAlNQj9U9vvwmjrHwZXikh8B2jE0hk
 zEBlZJux7thh9O7zcISJzhlhad2oNlKWzVyjhNiUce_dFieVxuluCiIzdJfzIsGkTkEsc5.ZCaAK
 _D3QeFQr9sCl1RVoNTXnlRxrMGcwRisLw8VODLp5uAIbOH7N1N483qqhVp9hsTbs2eUrhoHAurvB
 taldscZ4uxu.dzvlg24ZucTkcdtSWK8aUSQpZl72yIDe8Sh.8OnTYBSaeqVJ2s3PectfKcSe0QrH
 k
X-Sonic-MF: <tlhackque@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.bf2.yahoo.com with HTTP; Tue, 28 Sep 2021 19:53:44 +0000
Received: by kubenode585.mail-prod1.omega.bf1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 16c2d306147a046f6ca22a19383a07da; 
 Tue, 28 Sep 2021 19:53:40 +0000 (UTC)
From: tlhackque <tlhackque@yahoo.com>
Subject: Configuring an endpoint with multiple listening ports
To: wireguard <wireguard@lists.zx2c4.com>
Message-ID: <4a40d2e4-2ed8-7e79-cd8f-7ef71e731e38@yahoo.com>
Date: Tue, 28 Sep 2021 15:53:39 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
References: <4a40d2e4-2ed8-7e79-cd8f-7ef71e731e38.ref@yahoo.com>
X-Mailer: WebService/1.1.19043
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
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

Recent discussions have suggested opening multiple UDP ports at the
"server" Endpoint of a tunnel to help overcome blocked ports, as
suggested in
https://lists.zx2c4.com/pipermail/wireguard/2018-November/003503.html.

As noted, it's fairly easy to redirect multiple ports on the server end
to a single ListenPort with NAT - whether with iptables or with
proprietary routers.

For the client (windows, android) as far as I can tell, the
configuration file syntax only allows a single Endpoint, with a single port.

This would indicate that either one should setup multiple peers (with
the same public key, AllowedIPs, etc) - one for each possible port - but
with different endpoint ports), or multiple tunnels (again duplicating
everything except the endpoint port).

If this is correct, it's awkward and error-prone.  It would be nice to
be able to specify something like [db8:123::10]:(51820,80,443,...) and
have the client try each port until it gets a response when it
(re-)initiates contact. It doesn't matter which port responds, since the
server's kernel sees the same listen port in every case.  (I guess the
client could even be aggressive and send the first packet to all ports -
since a quick reading of the protocol paper says that duplicates will be
discarded based on the timestamp.)

In any case, how do you recommend handling this configuration on the
client end?




