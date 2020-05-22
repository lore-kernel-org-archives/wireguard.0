Return-Path: <SRS0=143r=7E=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCE67C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 May 2020 08:44:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53DA0206C3
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 May 2020 08:44:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="uQXymCJC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53DA0206C3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7ee53179;
	Fri, 22 May 2020 08:29:36 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id eee91307
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 May 2020 08:29:35 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 70e739c7;
 Fri, 22 May 2020 08:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:from:to
 :subject:message-id:references:mime-version:content-type
 :in-reply-to; s=mail; bh=5s/iAkYx93q7LVX4YUs0tHOuEm8=; b=uQXymCJ
 CqGtpZSFckSI9Jz3afWT/FuvHIL3toEYVHD7fYUEXjEEz6T9O949zbfjLoccrTrm
 WykZfMm+Imz4YlAs/PYHtiIxQI8whbee5aVasRpBaye/eeBvUIXNcEUTOeKsLMRp
 Efn/ZOiB2Ts4icJZFWmiVfAoMn7VbgDqeTWJUrN3XrjA7K33rAq418SzDYXDHuTV
 W8bqoS7A9XnXAYc+8BuqyXGmooQ1GehW5clpXGj2giHMzNnFIfHkyPSbRzfaxmYi
 jIkss4D83MpyG/BhPaIpbwhBwPm4v6oRwyqvY9rZD+dfWH6Q2L+Ug6bYQjWVQktO
 DKez0Y8zJ+UI5mA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9ae91092
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Fri, 22 May 2020 08:29:35 +0000 (UTC)
Date: Fri, 22 May 2020 02:44:17 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: unit193@ubuntu.com, Daniel Kahn Gillmor <dkg@fifthhorseman.net>,
 Andy Whitcroft <apw@canonical.com>,
 Ubuntu Kernel Team <kernel-team@lists.ubuntu.com>,
 Martin Hauke <mardnh@gmx.de>, Joe Doss <joe@solidadmin.com>,
 Neal Gompa <ngompa@fedoraproject.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Adding Debian, Ubuntu, OpenSUSE, RHEL, CentOS kernels to
 WireGuard CI: Seeking URLs
Message-ID: <20200522084417.GA1311327@zx2c4.com>
References: <CAHmME9oX+8HoK_wAoc5oR9rWenYz4ki8EK+NebQEV2ALZDSrdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHmME9oX+8HoK_wAoc5oR9rWenYz4ki8EK+NebQEV2ALZDSrdg@mail.gmail.com>
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

On Fri, May 22, 2020 at 02:04:58AM -0600, Jason A. Donenfeld wrote:
> I'd like to put these on build.wireguard.com to mitigate breakage. In
> order to make this happen, I'll need two things:
> - A URL I can scape that will give me the latest kernel versions for
> relevant distros.
> - A URL I can construct using a selected version to download a boring
> kernel source tarball.
> I would prefer to not involve git, if possible, and for these URLs to
> point to the sources for actual kernels that are shipping as the
> standard latest-kernel for each of the above releases.

Here's a bash example that achieves part 1, to give a more concrete
idea of what I'm after:

    declare -A UBUNTU_SERIES_KERNELS
    while read -r line; do
        [[ $line =~ ^\ *linux\ +\|\ ([0-9.-]+)\ +\|\ ([a-z]+)(-[a-z]+)?\ +\|\ source$ ]] || continue
        version="${BASH_REMATCH[1]}" series="${BASH_REMATCH[2]}" repo="${BASH_REMATCH[3]}"
        [[ $repo != -proposed ]] || continue
        read -r smaller < <(printf '%s\n3.10\n' "$version" | sort -V)
        [[ $smaller == 3.10 ]] || continue
        UBUNTU_SERIES_KERNELS[$series]+="$version "
    done < <(curl -Ls https://people.canonical.com/~ubuntu-archive/madison.cgi?package=linux&a=&c=&s=)
    UBUNTU_KERNELS=( )
    for series in "${!UBUNTU_SERIES_KERNELS[@]}"; do
        read -r kernel < <(sort -Vur <<<"${UBUNTU_SERIES_KERNELS[$series]// /$'\n'}")
        [[ -n $kernel ]] && UBUNTU_KERNELS+=( "$kernel" )
    done
    printf -- '- %s\n' "${UBUNTU_KERNELS[@]}"

The output of this script is something like:

- 4.15.0-101.102
- 5.4.0-26.30
- 5.4.0-31.35
- 4.4.0-179.209
- 3.13.0-170.220
- 5.3.0-53.47
- 5.0.0-38.41

The next step would be turning these version numbers into URLs to the
tarballs. Hopefully the team at Canonical can assist with providing
that.

Jason
