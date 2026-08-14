Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E573ECA5FFD
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Oct 2026 08:16:41 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id fc7e7924;
	Mon, 5 Oct 2026 06:56:33 +0000 (UTC)
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [2607:f8b0:4864:20::52c])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 151a3561
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Aug 2026 08:25:21 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-cbf0dc8c871so315164a12.1
 for <wireguard@lists.zx2c4.com>; Fri, 14 Aug 2026 01:25:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786695919; cv=none;
 d=google.com; s=arc-20260327;
 b=EinVVpePqrdmnKUM9un+4rpBJoM3N2qA/etFPc9RzglXzuTHWQYkPPTXIpPicVHWlg
 VB1okYoVZehTBC6q7iRfh2T0Z8O7ARJqVkI6fORF1nFXS4NdItcc7KIFI87Jg5yxaBo0
 1LZohcwZkJiMO2yFIFhBwD/fmC6ufiVznKecrqz3cf7QKm1kKVJcx4ZpmdNp3NsDkR+D
 Z5Y0SzSFs3Roezcxq3drHnXD8vTJUnQ0K3GRBGZU6tyBQHLS7L5O9yTi45217OMdSfFf
 tztxg3LRd2orSS9srT7doJuIIy5oxbHvHrBlDcDrzp6QuA8DcDqWPfyvdmC75qQ6YRZw
 UWfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=vKSFXdVJKGzKm3HehUSqxjGaXXJvHSjCo/A2fRHRECY=;
 fh=1CsOgAxkj0tSFTO0bRovl0wQS24+EZdEApJbdc/Xo54=;
 b=PEKWde3PBEQOlnsgbzpqsRCCfwaiHP/GbUyF7JhjaTmKNU+Ueyl9kbS80YpotJGxdn
 97UgtY6+2HsIru2FuUgRTScoPHEo5/nBiHeUgZKTPNemcQ1BW9QWCv8ia1n7hOhmnlFW
 H0Cd2WPegWO5qdME3wROgYOmKdC+ZkyIgyF8/vJ6fw6j4opYe9/MwkNuQ7xS4WbfE9yr
 9j9zpazr9jDD6Pmk+JMFWczN+OC7uDBVwe2fSRuyRdQ52otoBiwn3/tuCw6ZZ3QGQlHc
 YjQczeMwTmSaq5O2WxTbBMjI1QZ2/VbNUvU97iTVXVTqxNss66ikeCZYJrIKhgBXMwPE
 GTDQ==; darn=lists.zx2c4.com
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786695919; x=1787300719; darn=lists.zx2c4.com;
 h=content-transfer-encoding:content-type:to:subject:message-id:date
 :from:in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=vKSFXdVJKGzKm3HehUSqxjGaXXJvHSjCo/A2fRHRECY=;
 b=oAZsBs43C4jn4kThpa/LXTH8dfje1hGlNhr23uRnObq/GZffh41yEl8gwL20ccsgVO
 f2g2Ib95E6aVElCSIbqVeHSJnfiJPSSk1QaECKrMqQR4TPmEovNvqOkwK1eY99q03PtF
 f58pOZi8mdzInXuQBjIpguqdyOBG85AFyirUiEhgnZN8mfizGvUXTzJ4ymKbww9Xpv7E
 C1VpMS/56Xnw7eWVW+AbUiWd+wnj8KSx5wXj3pjBzSdWOxYm1ZRp95ds9ul2V2+wqe+Q
 ElKSZDnQl3tkgPMRcu0eznsTYgdH+O0pxZ3AI8cBj7iU/HYAyvbfOW97uBNPP0owce9f
 M2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786695919; x=1787300719;
 h=content-transfer-encoding:content-type:to:subject:message-id:date
 :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=vKSFXdVJKGzKm3HehUSqxjGaXXJvHSjCo/A2fRHRECY=;
 b=EMdIPwx281PP3ZAtxzOcovtLpitMYu0gplIYRS5S+FIYzVCupIniIzz38EpGLG81zX
 QD5LMi0WzReZGiXptGnBKkZyG7li5kYwjKcY0gLh4T3oSMVP4JqvTr12qV37b7l3SK8U
 YJ+QwD2bbV8oYisk3yRvo65/gAdr1UcshKwFsl3+uESBSnFemDWZ3ZWGHqJrWFeQTr1o
 Qopkd81Y6A1dxaVpyGq82hPhUOKcstxC7CUDlHSLIqMEyYR71FYyEegtz4s+sR4Jrbkg
 mhi04C5CUaHSO3BlwTb16nZFIEd8x7W47uEIwvtl4MTJ+qLeDbpYbAM6cDDJQgMs4ZHU
 P1PQ==
X-Gm-Message-State: AOJu0Yy97hDhfhSh88RTLp4P7D53i5BKqodwu76dPIn6FvjbQF161oSo
 7yQBwbI34XgtTuGjjXpsVeLFuWvmdIhddHs1Obh0mpOgjivsWSc0WZzzlFLBaz0PBwGFeUQn6hz
 GcTwr4ATjXt57/jTTH1Em8wAG1iHVk1N3jqGjICJsXg==
X-Gm-Gg: AR+sD100PgTEC+plS/poIWQLyVDrSkNeIC/wyXh9T1mYImTz2e/nfr7oBcld7BvMPgf
 bpvwFg1VM0tXvPhZNW70jkI1I/oLna9KSCV5khTxPX2bb7PFY1bQScUgg9n+DjykWZRGlvmhpya
 V6PJMCGe2U8tzW0se6DaI0i2A+6bl0lFRbHKaNJp+4fPTsnGECHwzBe670N5/HFjQXwnz8EeaGQ
 IElAM+NmeTZZe+UpQ9sMSAntXpNhucJwY291PXqisubcTQ8gmn6gTf1yTJagPCEruaZM/xVEgMp
 OLO2q3KKmK7YYYb+ovJkHJMpapsSOOPybkMVhWH7QJWU
X-Received: by 2002:a05:6a21:4cca:b0:3cc:45cc:c401 with SMTP id
 adf61e73a8af0-3cc71a256bfmr4888342637.13.1786695919080; Fri, 14 Aug 2026
 01:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <CADk5WnNyF_Kk7e4GZuO5LepG1JzMPZ-_6s4nvFdftvQih-YgYA@mail.gmail.com>
In-Reply-To: <CADk5WnNyF_Kk7e4GZuO5LepG1JzMPZ-_6s4nvFdftvQih-YgYA@mail.gmail.com>
From: grog <grogdor@gmail.com>
Date: Fri, 14 Aug 2026 02:25:07 -0600
X-Gm-Features: AUfX_mxgaaUMJElM6O_1WEAja_tZ2y4nfjXqLBARIPcrEA6a2ff6WaDWHUKMpGo
Message-ID: <CADk5WnMBrMLL4mfc4z7ibs8APkJMKcwQH3hEMkyK_CZ2rEk1Sw@mail.gmail.com>
Subject: Re: [PATCH] wg-quick: darwin: debounce networksetup DNS calls to
 prevent cascade storms
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

Expanded to not ignore changed search-domain:

---
 src/wg-quick/darwin.bash | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/src/wg-quick/darwin.bash b/src/wg-quick/darwin.bash
index fa74edd..156c781 100755
--- a/src/wg-quick/darwin.bash
+++ b/src/wg-quick/darwin.bash
@@ -293,17 +293,33 @@ set_endpoint_direct_route() {

 set_dns() {
  collect_new_service_dns
- local service response
+ local service response current_dns current_dns_search target_dns
target_dns_search
+ target_dns=3D"${DNS[*]}"
+ target_dns_search=3D"${DNS_SEARCH[*]}"
+ [[ -n $target_dns_search ]] || target_dns_search=3DEmpty
+
  for service in "${!SERVICE_DNS[@]}"; do
+ current_dns=3D""
+ current_dns_search=3D""
+
+ if current_dns=3D"$(networksetup -getdnsservers "$service" 2>/dev/null)";=
 then
+ current_dns=3D"${current_dns//$'\n'/ }"
+ fi
+ if current_dns_search=3D"$(networksetup -getsearchdomains "$service"
2>/dev/null)"; then
+ [[ $current_dns_search =3D=3D *" "* ]] && current_dns_search=3DEmpty
+ current_dns_search=3D"${current_dns_search//$'\n'/ }"
+ fi
+
  while read -r response; do
  [[ $response =3D=3D *Error* ]] && echo "$response" >&2
  done < <(
- cmd networksetup -setdnsservers "$service" "${DNS[@]}"
- if [[ ${#DNS_SEARCH[@]} -eq 0 ]]; then
- cmd networksetup -setsearchdomains "$service" Empty
- else
- cmd networksetup -setsearchdomains "$service" "${DNS_SEARCH[@]}"
+ [[ $current_dns =3D=3D "$target_dns" ]] ||
+ cmd networksetup -setdnsservers "$service" "${DNS[@]}"
+ if [[ $current_dns_search !=3D "$target_dns_search" ]]; then
+ if [[ ${#DNS_SEARCH[@]} -eq 0 ]]; then
+ cmd networksetup -setsearchdomains "$service" Empty
+ else
+ cmd networksetup -setsearchdomains "$service" "${DNS_SEARCH[@]}"
+ fi
  fi
  )
  done
--=20
2.39.2

On Fri, Aug 14, 2026 at 2:15=E2=80=AFAM grog <grogdor@gmail.com> wrote:
>
> When a WireGuard interface with a DNS directive is brought up on
> macOS, wg-quick launches a monitor_daemon that listens to routing
> changes via `route -n monitor`. Upon any routing change, it
> unconditionally invokes `networksetup` to reapply the DNS settings.
>
> However, invoking `networksetup` commits to SCPreferences, which
> forces configd to broadcast kSCDynamicStoreDomainSetup. Native network
> daemons (such as airportd) intercept this and rebuild their network
> interfaces, temporarily locking the networking driver. This
> reconfiguration triggers another kernel routing change event, which
> the monitor_daemon catches, causing an endless cascade storm that
> spikes airportd to 100% CPU.
>
> While not a strict, unbounded infinite loop (the storm eventually
> dampens out due to macOS `configd` event coalescing and the `sleep 2`
> throttle in the `wg-quick` monitor), it causes intense cascade
> storms=E2=80=94in our traces, this resulted in `airportd` accumulating **=
13+
> hours of total CPU time over a 5.5-day uptime**, and exacerbated Wi-Fi
> flapping by constantly locking the network driver during interface
> rebuilds.
>
> This patch adds a debounce check in `set_dns()` to verify if the DNS
> is already correctly set before invoking `networksetup`, breaking the
> feedback loop.
>
> ---
>  src/wg-quick/darwin.bash | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/src/wg-quick/darwin.bash b/src/wg-quick/darwin.bash
> index fa74edd..446f13c 100755
> --- a/src/wg-quick/darwin.bash
> +++ b/src/wg-quick/darwin.bash
> @@ -296,6 +296,12 @@ set_endpoint_direct_route() {
>  set_dns() {
>   collect_new_service_dns
>   local service response
>   for service in "${!SERVICE_DNS[@]}"; do
> +
> + local current_dns=3D"$(networksetup -getdnsservers "$service" 2>/dev/nu=
ll)"
> + local target_dns=3D"${DNS[*]}"
> + if [[ "${current_dns//$'\n'/ }" =3D=3D "$target_dns" ]]; then
> + continue
> + fi
> +
>   while read -r response; do
>   [[ $response =3D=3D *Error* ]] && echo "$response" >&2
>   done < <(
> --
> 2.39.2
