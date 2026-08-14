Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14279CA5FCE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 08:16:40 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 855cb1c0;
	Mon, 5 Oct 2026 06:56:32 +0000 (UTC)
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [2607:f8b0:4864:20::102d])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id a298688b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Aug 2026 08:15:35 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-38125cebfdaso1005997a91.1
 for <wireguard@lists.zx2c4.com>; Fri, 14 Aug 2026 01:15:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786695333; cv=none;
 d=google.com; s=arc-20260327;
 b=l9Z2WupfhO4Lan6NQ/do6909qyim4f5Wo2MRFWDadPHLkB1yGTlbTGQ6NBfYxmGPwS
 k5WNACk0c2GRFf8duiOnw1QZCBwWFfeCzFdoRkJmmrOFbZIJ8COldkvJxeUK+KyX089J
 9K2ATF52t4vIBCx3iiDorPKelw0he83j0SbTokL5QIGZlDedH3xYvKT/DEAFnA5gg3Cx
 z5LkIhoruFpGfIzotME310j/wtAA+S44R7w09Fn2/RP+COdLORzCEe0S6BdPt2Tx1AdN
 c3qQEl4k3nQ5I/1YQmUZyFGMpRmsunUQch+suQsMU9t/sq2dEbSuL6YRx2IyH/q6qNyk
 7pJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:dkim-signature;
 bh=4piT0BRA1tazGlVIB3YJfMJzj+odq/lY60bIt+WRT2c=;
 fh=1CsOgAxkj0tSFTO0bRovl0wQS24+EZdEApJbdc/Xo54=;
 b=XhJDCnO6yoU2pswrPCuqO45UpY5sTM7ckGxewMrK4MymBIxxoMtjBq2ay9tz0cLSj3
 EtG1NLbCLOP6k9mbu6O+we2iOHxYvinjL3ARFWEra5L5yL5qaZKaaHlX9uRycphMhDbR
 GvQWG4gXcg5SHdspg+BpkMoHGy4hLLFZA5fvDd6PwSRpuKn36aW6s+Myypf4TAdVPIC5
 8dutnyBhjYs5GOrM/0tPX/OceVHq1Wajwp6WEJEzo+0+StbdcKfpn1Wa3zIBeu2bFbq4
 rtjjIPwwS4tYQx86X0lDGYWFqpb2e9MynDtuCYLD4UAX1dzAfh0RGQEvFdpsx3dlCiSk
 AkyQ==; darn=lists.zx2c4.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786695333; x=1787300133; darn=lists.zx2c4.com;
 h=content-transfer-encoding:content-type:to:subject:message-id:date
 :from:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=4piT0BRA1tazGlVIB3YJfMJzj+odq/lY60bIt+WRT2c=;
 b=GtNDQSrRN6bf3oYNGhJpEbsGUKLoQi2Rcsvdz4DOtIXh9gW6ijwBYgAFIKIry7SeAh
 KxgkgPNyjQxymDn3l+QBXattbG+IazIeaAAhTEUCIKshLdA/rxSLh3siZ/tfT97B1psT
 p/laxujsKR6lM4iRn6hONQd22DEPR+0nkNnQFTvLaH/1dWhuj3ZSFVffMx0BiqDnl8tp
 iC+xuosWz5jzFwzXxSZ6AfxZ7Mlfr4KHS/Td7G7GvxxzzS65OW9AIzOdipjmChTHzG/D
 htELc4eZ20Fpafnhjn5h1BaqamOx5IJGkycXGXFEsvVOeSiS3/jtonqY/M50iUiek/3c
 0QYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786695333; x=1787300133;
 h=content-transfer-encoding:content-type:to:subject:message-id:date
 :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=4piT0BRA1tazGlVIB3YJfMJzj+odq/lY60bIt+WRT2c=;
 b=iTXlQ5v+HIBHCv0BqmxImXE1pi2W11trmO7t3YtPZ89MjHqQrsUxdGImpBWTeEX9pB
 fvTvfDDFs5uoSKowVjh3KwEAAc+242VxvyeapC33KyjONOjLhkkNunWlO2e2Vazkqje/
 Kn9NAsCMoWyYD8RLN5f+T1Zy8a2KX968m/b6svmANqGzmr/JHvDBaNqrM8/u3/BjLsTN
 oqpfOkfEV6uf04Y+zcyXIHNrI0nb+nGH4q+Cnoe/HhC3JIYu0JWivsvx4bUvkTkmRs1v
 /ZtBlMj+CBxnpxy7X8tfsH5qQ6KkM3crXz6TtlFPDhQNwmZMNZiL8mZWT7SDg7n9Nef1
 tnYw==
X-Gm-Message-State: AOJu0YyO2ps7k9r39Ljil9Cm/kmesBNzq4fJldr8R9x96IHYlZVVl7JI
 xplYV8DtawxKrnMpvFqqGyEVI0gO+AePO3/jUe1k7A7+SDj0EEuZ1+Lk+4zolIAg0xAEHPDDu81
 jTX2zhYiybkuVkfCMAqLp/m5Od3WzVItd3CgS4ckoxA==
X-Gm-Gg: AR+sD12pZmIAg8BC/ksvvafkmn5oYdNQan2cXmIE9hRm2IPe4uXcO5xjBk+u/DZkCi9
 rPSI+Qmq6SqO4tXQvTyufxVCCUeln1TlFxbxHG+a46B2eZhwoKy1KUgjrcUfNgZ+9cXRjMypk7H
 td/TaX+N1x1DdDt7T1uQOpsEmWF/fagRuVUgiAtziXReE48gh79iWRAWs0syFMBfNjpZr4Cml5G
 MqqxnBQxs1npPqzr6tAaECm2XnwNQ3mRjMyh9+bJGaLpze6bcsFoxeLWUu1FjiSXWfSiPQ8W7fy
 946m+i+KkiWu/E5e2iDC1AmU12EDsmUCnDFVBViT9Qd4
X-Received: by 2002:a17:90b:48ce:b0:390:b41a:b92b with SMTP id
 98e67ed59e1d1-3933b6d05c3mr5003093a91.4.1786695333150; Fri, 14 Aug 2026
 01:15:33 -0700 (PDT)
MIME-Version: 1.0
From: grog <grogdor@gmail.com>
Date: Fri, 14 Aug 2026 02:15:21 -0600
X-Gm-Features: AUfX_mwA5u4Fu19jZOg-tKgxXODXlBkNpOFOzl6QtD4NS5ThJYkGUyQ0t6VNkFM
Message-ID: <CADk5WnNyF_Kk7e4GZuO5LepG1JzMPZ-_6s4nvFdftvQih-YgYA@mail.gmail.com>
Subject: [PATCH] wg-quick: darwin: debounce networksetup DNS calls to prevent
 cascade storms
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 05 Oct 2026 06:55:46 +0000
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

When a WireGuard interface with a DNS directive is brought up on
macOS, wg-quick launches a monitor_daemon that listens to routing
changes via `route -n monitor`. Upon any routing change, it
unconditionally invokes `networksetup` to reapply the DNS settings.

However, invoking `networksetup` commits to SCPreferences, which
forces configd to broadcast kSCDynamicStoreDomainSetup. Native network
daemons (such as airportd) intercept this and rebuild their network
interfaces, temporarily locking the networking driver. This
reconfiguration triggers another kernel routing change event, which
the monitor_daemon catches, causing an endless cascade storm that
spikes airportd to 100% CPU.

While not a strict, unbounded infinite loop (the storm eventually
dampens out due to macOS `configd` event coalescing and the `sleep 2`
throttle in the `wg-quick` monitor), it causes intense cascade
storms=E2=80=94in our traces, this resulted in `airportd` accumulating **13=
+
hours of total CPU time over a 5.5-day uptime**, and exacerbated Wi-Fi
flapping by constantly locking the network driver during interface
rebuilds.

This patch adds a debounce check in `set_dns()` to verify if the DNS
is already correctly set before invoking `networksetup`, breaking the
feedback loop.

---
 src/wg-quick/darwin.bash | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/src/wg-quick/darwin.bash b/src/wg-quick/darwin.bash
index fa74edd..446f13c 100755
--- a/src/wg-quick/darwin.bash
+++ b/src/wg-quick/darwin.bash
@@ -296,6 +296,12 @@ set_endpoint_direct_route() {
 set_dns() {
  collect_new_service_dns
  local service response
  for service in "${!SERVICE_DNS[@]}"; do
+
+ local current_dns=3D"$(networksetup -getdnsservers "$service" 2>/dev/null=
)"
+ local target_dns=3D"${DNS[*]}"
+ if [[ "${current_dns//$'\n'/ }" =3D=3D "$target_dns" ]]; then
+ continue
+ fi
+
  while read -r response; do
  [[ $response =3D=3D *Error* ]] && echo "$response" >&2
  done < <(
--=20
2.39.2
