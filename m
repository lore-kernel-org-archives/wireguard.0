Return-Path: <SRS0=fVBb=X7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,HTML_MESSAGE,MAILING_LIST_MULTI,
	NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C13FC4360C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Oct 2019 16:55:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC75620835
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Oct 2019 16:55:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWawh+F7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC75620835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f351e390;
	Sun, 6 Oct 2019 16:55:05 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 90f752cc
 for <wireguard@lists.zx2c4.com>; Sun, 6 Oct 2019 16:55:00 +0000 (UTC)
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com
 [IPv6:2607:f8b0:4864:20::92a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9a74189a
 for <wireguard@lists.zx2c4.com>; Sun, 6 Oct 2019 16:55:00 +0000 (UTC)
Received: by mail-ua1-x92a.google.com with SMTP id b14so3371224uap.6
 for <wireguard@lists.zx2c4.com>; Sun, 06 Oct 2019 09:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=M79lbKgB2VoUvYeCCh42AzaQDo7/5XZAlxzKcPPSKLI=;
 b=gWawh+F76v8IqaLtRmMkQZK0OIX8AU2N34Av4j7kBhe+AEERuOfVnUls+SR4frH/Wv
 MSkOUofj6EqyY1vcCBhSNSLOIvtqTqHcsrLX4BPf87xMaC5azhstTmN4lrBWS96rnaFg
 IFj9sZfxKMukc7tGb03WHxjjrWIxMyWJlW6DB/AVHG0xSLT+Rlwo4ZA382hp6XcviREO
 jSmhC55I7FU2Gb25U/pw0XyGgIooC4WzM7+rnx4kzuwr4scxBBSGfQb6MBvOX2P6xwLe
 e6+B6U44ZIR5ryIUqwztSa7zueKk9Cny5cb9OiBzEf020GvyvNuY9dRSKH4sc0i7m/wN
 GY8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=M79lbKgB2VoUvYeCCh42AzaQDo7/5XZAlxzKcPPSKLI=;
 b=fVgV420u+TdRb64ODBFphi7c+jj+jB26fQEJj7rLMswKwDtdltTVfZ1ZS8PBEHilKG
 fc/4Hec+KO5wh2S7gSjZnjFoFzpUbEye1rRxuc5tcNugQP6mo4BcV6tRedjl85r/MlBB
 63cVAWXw8hgOw9OF1hzvIoQMz32GscGGWXlHOs3n98PPINPK6MSBJmXeu7Qjh/040yMa
 aZe4RBdwYDxCblKz9jCsmlw28taxcsOCXQeGwWNH+CxkUU+iic4uYpHaxRNsytFZTmrS
 xDuTFCPl4NW+TmLXabLW1ekNL9GHDBWF96+RB3Fc3goQGEBj70qy+gUxUWzZMW5hSxs8
 6Geg==
X-Gm-Message-State: APjAAAVnpwYT7UxdhWIPygrLhDoELuwi9H5T+fVN/3SuUpKa6B3Mphqg
 hbSGzEkk6oLzK98fv+dnx6g5pZGDX0d/ISMxYm0joA6NH24=
X-Google-Smtp-Source: APXvYqywJ46bmKgS9tY0Y2NROeugD6VqAACB4RltJiZzMyVrIT0gpQoipW3DAa77HxskaSh2vGPfcq+UymDO0mBANCc=
X-Received: by 2002:ab0:3310:: with SMTP id r16mr11588424uao.22.1570380898503; 
 Sun, 06 Oct 2019 09:54:58 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?QWRyacOhbiBNaWjDoWxrbw==?= <adriankoooo@gmail.com>
Date: Sun, 6 Oct 2019 18:54:47 +0200
Message-ID: <CA+Hw3ebFCOoc6N_sn9HsaGmLiFp68XY+jLV83NS5JqmtLZ=8-g@mail.gmail.com>
Subject: wg-quick systemd service doesn't work after boot
To: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============0072230040142211678=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0072230040142211678==
Content-Type: multipart/alternative; boundary="0000000000009e12d4059440cb1d"

--0000000000009e12d4059440cb1d
Content-Type: text/plain; charset="UTF-8"

I have 3 wg interface on my server, but I am unable to enable wg0 with
wg-quick at boot:

@ubuntu:~$ sudo systemctl enable wg-quick@wg0
@ubuntu:~$

Oct 06 13:22:51 ubuntu systemd[1]: Starting WireGuard via wg-quick(8) for
wg0...
Oct 06 13:22:51 ubuntu wg-quick[1737]: Warning: `/etc/wireguard/wg0.conf'
is world accessible
Oct 06 13:22:52 ubuntu wg-quick[1737]: [#] ip link add wg0 type wireguard
Oct 06 13:22:52 ubuntu wg-quick[1737]: [#] wg setconf wg0 /dev/fd/63
Oct 06 13:22:52 ubuntu wg-quick[1737]: [#] ip -4 address add 192.168.5.2/24
dev wg0
Oct 06 13:22:52 ubuntu wg-quick[1737]: [#] ip link set mtu 1420 up dev wg0
Oct 06 13:22:53 ubuntu wg-quick[1737]: [#] ip -4 route add 192.168.2.0/24
dev wg0
Oct 06 13:22:53 ubuntu wg-quick[1737]: [#] iptables -A FORWARD -i wg0 -j
ACCEPT; iptables -A FORWARD -o wg0 -j ACCEPT; iptables -t nat -A
POSTROUTING -o e
*Oct 06 13:22:53 ubuntu wg-quick[1737]: Another app is currently holding
the xtables lock. Perhaps you want to use the -w option?*
Oct 06 13:22:53 ubuntu wg-quick[1737]: [#] ip link delete dev wg0
Oct 06 13:22:53 ubuntu systemd[1]: wg-quick@wg0.service: Main process
exited, code=exited, status=1/FAILURE
Oct 06 13:22:53 ubuntu systemd[1]: Failed to start WireGuard via
wg-quick(8) for wg0.
Oct 06 13:22:53 ubuntu systemd[1]: wg-quick@wg0.service: Unit entered
failed state.
Oct 06 13:22:53 ubuntu systemd[1]: wg-quick@wg0.service: Failed with result
'exit-code'.

As you can see it fails at iptables command.

wg0, wg2 fails with this problem, but wg1 starts without problem (same
config, with iptables command).

--0000000000009e12d4059440cb1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">I have 3 wg interface on=
 my server, but I am unable to enable wg0 with wg-quick at boot:<br><br>@ub=
untu:~$ sudo systemctl enable wg-quick@wg0<br>@ubuntu:~$=C2=A0<div><br></di=
v><div><div>Oct 06 13:22:51 ubuntu systemd[1]: Starting WireGuard via wg-qu=
ick(8) for wg0...</div><div>Oct 06 13:22:51 ubuntu wg-quick[1737]: Warning:=
 `/etc/wireguard/wg0.conf&#39; is world accessible</div><div>Oct 06 13:22:5=
2 ubuntu wg-quick[1737]: [#] ip link add wg0 type wireguard</div><div>Oct 0=
6 13:22:52 ubuntu wg-quick[1737]: [#] wg setconf wg0 /dev/fd/63</div><div>O=
ct 06 13:22:52 ubuntu wg-quick[1737]: [#] ip -4 address add <a href=3D"http=
://192.168.5.2/24">192.168.5.2/24</a> dev wg0</div><div>Oct 06 13:22:52 ubu=
ntu wg-quick[1737]: [#] ip link set mtu 1420 up dev wg0</div><div>Oct 06 13=
:22:53 ubuntu wg-quick[1737]: [#] ip -4 route add <a href=3D"http://192.168=
.2.0/24">192.168.2.0/24</a> dev wg0</div><div>Oct 06 13:22:53 ubuntu wg-qui=
ck[1737]: [#] iptables -A FORWARD -i wg0 -j ACCEPT; iptables -A FORWARD -o =
wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o e</div><div><b>Oct 06 13:2=
2:53 ubuntu wg-quick[1737]: Another app is currently holding the xtables lo=
ck. Perhaps you want to use the -w option?</b></div><div>Oct 06 13:22:53 ub=
untu wg-quick[1737]: [#] ip link delete dev wg0</div><div>Oct 06 13:22:53 u=
buntu systemd[1]: wg-quick@wg0.service: Main process exited, code=3Dexited,=
 status=3D1/FAILURE</div><div>Oct 06 13:22:53 ubuntu systemd[1]: Failed to =
start WireGuard via wg-quick(8) for wg0.</div><div>Oct 06 13:22:53 ubuntu s=
ystemd[1]: wg-quick@wg0.service: Unit entered failed state.</div><div>Oct 0=
6 13:22:53 ubuntu systemd[1]: wg-quick@wg0.service: Failed with result &#39=
;exit-code&#39;.</div></div><div><br></div><div>As you can see it fails at =
iptables command.</div><div><br></div><div>wg0, wg2 fails with this problem=
, but wg1 starts without problem (same config, with iptables command).</div=
><div><br></div><div><br></div></div></div></div>

--0000000000009e12d4059440cb1d--

--===============0072230040142211678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0072230040142211678==--
