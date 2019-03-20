Return-Path: <SRS0=tKTr=RX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD24C4360F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:40:53 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05ACA2183E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:40:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lf2A/Ffi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05ACA2183E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0dd6a277;
	Wed, 20 Mar 2019 22:39:52 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5061de37
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Mar 2019 06:53:14 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7782d2b
 for <wireguard@lists.zx2c4.com>;
 Wed, 20 Mar 2019 06:53:14 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id f3so19436413wmj.4
 for <wireguard@lists.zx2c4.com>; Tue, 19 Mar 2019 23:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=00panCjabraXtawboilWRvWjBYNNWMmE15KOOfBVZTI=;
 b=Lf2A/FfizZf3x3EPclzMWvVo+eJsjisnSsvvI9xxFOoLMmelJ5WhJL/MlXvq/RHNKC
 HUSNg6XcVrOXAU1egpktMGgV3OWbBU61ydz+PeGnRs9k9PTMbpKAnjyxizN48NJggA1l
 yjmubyoaLj84XJ8OXZwxFXiVkAsXWDP5fuDMCL3tu66KhQRV5ObuqX8i4yIdEMpk3geb
 UBCCji3tnq2kYAHSDrlEcpdlDhvPlhsdnPZpsodq5KkfXdYKIpYoLTMxA88SVq3wk6Rb
 hLTnJSu6YYhZLWlYM5mNLkfSS3kLYj8hMiXo36DzVFDeS7N0P/cEB8oaX3ez8OJBFqUI
 kMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=00panCjabraXtawboilWRvWjBYNNWMmE15KOOfBVZTI=;
 b=VQnbzMgiHy7u/nQoHK1njR6CWx85vWRrLfBC4iuX1MAbleb03lsX/7dpO1Ztpa7/Uz
 BrhWyPOs0Cmknxe7nRygDffVWOZ3r+fi4BwJxV/J9QxaV0V0hm1y7pYEppse+njEEnI0
 wAg3y9lt2m68bdJ5OpiJaFWt+Vq3ggzLzyb8yIlNtRI9l6Oe5lcpQ36QEJFPNGYaUO7R
 XbxaCRoqe2BKsrt7ZBJxSK4PU4413WEpWOPHlHacUWYV7UaDSor/nEH4LL0KNFlmB+Dz
 eYvtDehOKYES4VsaTFURF0spZvLNYXh6CHrOWo6jUHrcr5mA/BhoE1ZiA0bmLK0tlVAM
 BgtQ==
X-Gm-Message-State: APjAAAU4jv3YP8PCbMfmDf8kOYCpWqg+7VYa9QugRhd9/LNni4eEzhBO
 KSR+sjEqkvg3C+yIiB6RGjJLoKes2UBNFC8F0GIQI2Vf2aYAmg==
X-Google-Smtp-Source: APXvYqxC+GBoiSknnNM52+UmuAIITe1WdvROJlaN2m0tCYjKxck4N4FKEsToTHBi7gD82oRT9VuyJnEucOvDr3akjmk=
X-Received: by 2002:a1c:700a:: with SMTP id l10mr7231750wmc.13.1553064807606; 
 Tue, 19 Mar 2019 23:53:27 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?Q2/Fn2t1IEJhxZ8=?= <cosku.bas@gmail.com>
Date: Wed, 20 Mar 2019 09:53:16 +0300
Message-ID: <CAAvxC942GC6EBFCnVyLJN6YHW01iMmP7h6c45Nr0Sq4xoq2hyQ@mail.gmail.com>
Subject: [PATCH] darwin wg-quick dns reset
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 20 Mar 2019 23:39:51 +0100
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
Content-Type: multipart/mixed; boundary="===============4802936730104978293=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4802936730104978293==
Content-Type: multipart/alternative; boundary="0000000000002baced05848114e4"

--0000000000002baced05848114e4
Content-Type: text/plain; charset="UTF-8"

While fiddling with wg-quick on macos, I've noticed that the DNS settings
coming from the configuration file persists after calling wg-quick down on
the same config. I'm guessing this is not the intended behaviour. If it is
please ignore the patch.
----
diff --git a/src/tools/wg-quick/darwin.bash b/src/tools/wg-quick/darwin.bash
index aa3edeb..ef68bc4 100755
--- a/src/tools/wg-quick/darwin.bash
+++ b/src/tools/wg-quick/darwin.bash
@@ -280,11 +280,12 @@ set_dns() {
 }

 del_dns() {
+ collect_new_service_dns
  local service response
  for service in "${!SERVICE_DNS[@]}"; do
  while read -r response; do
  [[ $response == *Error* ]] && echo "$response" >&2
- done < <(cmd networksetup -setdnsservers "$service"
${SERVICE_DNS["$service"]} || true)
+ done < <(cmd networksetup -setdnsservers "$service" "Empty" || true)
  done
 }

@@ -442,6 +443,7 @@ cmd_down() {
  execute_hooks "${PRE_DOWN[@]}"
  [[ $SAVE_CONFIG -eq 0 ]] || save_config
  del_if
+ del_dns
  execute_hooks "${POST_DOWN[@]}"
 }

--0000000000002baced05848114e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">While fiddling with wg-quick on macos, I&=
#39;ve noticed that the DNS settings coming from the configuration file per=
sists after calling wg-quick down on the same config. I&#39;m guessing this=
 is not the intended behaviour. If it is please ignore the patch.<br>----<d=
iv><div>diff --git a/src/tools/wg-quick/darwin.bash b/src/tools/wg-quick/da=
rwin.bash</div><div>index aa3edeb..ef68bc4 100755</div><div>--- a/src/tools=
/wg-quick/darwin.bash</div><div>+++ b/src/tools/wg-quick/darwin.bash</div><=
div>@@ -280,11 +280,12 @@ set_dns() {</div><div>=C2=A0}</div><div>=C2=A0</d=
iv><div>=C2=A0del_dns() {</div><div>+<span style=3D"white-space:pre">	</spa=
n>collect_new_service_dns</div><div>=C2=A0<span style=3D"white-space:pre">	=
</span>local service response</div><div>=C2=A0<span style=3D"white-space:pr=
e">	</span>for service in &quot;${!SERVICE_DNS[@]}&quot;; do</div><div>=C2=
=A0<span style=3D"white-space:pre">		</span>while read -r response; do</div=
><div>=C2=A0<span style=3D"white-space:pre">			</span>[[ $response =3D=3D *=
Error* ]] &amp;&amp; echo &quot;$response&quot; &gt;&amp;2</div><div>-<span=
 style=3D"white-space:pre">		</span>done &lt; &lt;(cmd networksetup -setdns=
servers &quot;$service&quot; ${SERVICE_DNS[&quot;$service&quot;]} || true)<=
/div><div>+<span style=3D"white-space:pre">		</span>done &lt; &lt;(cmd netw=
orksetup -setdnsservers &quot;$service&quot; &quot;Empty&quot; || true)</di=
v><div>=C2=A0<span style=3D"white-space:pre">	</span>done</div><div>=C2=A0}=
</div><div>=C2=A0</div><div>@@ -442,6 +443,7 @@ cmd_down() {</div><div>=C2=
=A0<span style=3D"white-space:pre">	</span>execute_hooks &quot;${PRE_DOWN[@=
]}&quot;</div><div>=C2=A0<span style=3D"white-space:pre">	</span>[[ $SAVE_C=
ONFIG -eq 0 ]] || save_config</div><div>=C2=A0<span style=3D"white-space:pr=
e">	</span>del_if</div><div>+<span style=3D"white-space:pre">	</span>del_dn=
s</div><div>=C2=A0<span style=3D"white-space:pre">	</span>execute_hooks &qu=
ot;${POST_DOWN[@]}&quot;</div><div>=C2=A0}</div></div><div><br></div></div>=
</div>

--0000000000002baced05848114e4--

--===============4802936730104978293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4802936730104978293==--
