Return-Path: <SRS0=jbYm=7F=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA579C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 May 2020 05:59:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01B2F206DD
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 May 2020 05:59:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="VjwhuESu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01B2F206DD
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b3408150;
	Sat, 23 May 2020 05:45:02 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9f2e353e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 23 May 2020 05:44:59 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9220b542;
 Sat, 23 May 2020 05:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=date:from:to
 :subject:message-id:references:mime-version:content-type
 :content-transfer-encoding:in-reply-to; s=mail; bh=X7TVUIzwtI7FO
 yLWfaAq9oR7EkA=; b=VjwhuESuy+U/G/qkcHAXUkPrTqObUyd0R9ScLe3T3VlVd
 nLPdMu0aZ+K7k8S4zd0M/UE64Dd2SITd47x4LrIMUStV3bv+PR4XEqPyOZ8+D5/p
 53ufdfcMfwBzf0ddEIzqgelf5RzgyCSH+HorUWTYTHa1vQobxBNcemEfTAOX9BPw
 /rbSixqEJkXXZ2aZi1TxElh9JB/vBueFYW1/oH6GH5rkJ8ppMLtXAcC6+khoDVgW
 aHzFuu94k3Mo+3t0UTIHrowqOjY/SLFMyEx/9jg4DkBa+yQP9N+JFKjufp1KNhyX
 mcBYShzubLldRMbaadrnbMMGBoWmVOjUl6mXZrpTA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d76b32b6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Sat, 23 May 2020 05:44:59 +0000 (UTC)
Date: Fri, 22 May 2020 23:59:47 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: unit193@ubuntu.com, Daniel Kahn Gillmor <dkg@fifthhorseman.net>,
 Andy Whitcroft <apw@canonical.com>,
 Ubuntu Kernel Team <kernel-team@lists.ubuntu.com>,
 Martin Hauke <mardnh@gmx.de>, Joe Doss <joe@solidadmin.com>,
 Neal Gompa <ngompa@fedoraproject.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Adding Debian, Ubuntu, OpenSUSE, RHEL, CentOS kernels to
 WireGuard CI: Seeking URLs
Message-ID: <20200523055947.GA1439839@zx2c4.com>
References: <CAHmME9oX+8HoK_wAoc5oR9rWenYz4ki8EK+NebQEV2ALZDSrdg@mail.gmail.com>
 <20200522084417.GA1311327@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200522084417.GA1311327@zx2c4.com>
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

Hey Canonical,

Things are now live on build.wireguard.com. Scroll to the bottom of [1]
to find your kernels. I haven't received much input from you on what
kernels you wanted me to develop against, so I've gone ahead with this
jenky thing:

declare -A URL_MAP
for series in focal eoan bionic xenial trusty; do
        refs="$(curl https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/$series/info/refs?service=git-upload-pack)"
        read -r kernel < <(while read -r line; do
                [[ $line =~ ^[a-f0-9]{44}\ refs/tags/Ubuntu-([0-9.-]+)$ ]] || continue
                echo "${BASH_REMATCH[1]}"
        done <<<"$refs" | sort -Vur) || unset kernel
        [[ -z $kernel ]] || URL_MAP["$kernel-ubuntu-$series"]="https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/$series/snapshot/Ubuntu-$kernel.tar.gz"
        read -r kernel < <(while read -r line; do
                [[ $line =~ ^[a-f0-9]{44}\ refs/tags/Ubuntu-hwe-([0-9._-]+)$ ]] || continue
                echo "${BASH_REMATCH[1]}"
        done <<<"$refs" | sort -Vur) || unset kernel
        [[ -z $kernel ]] || URL_MAP["$kernel-ubuntu-$series-hwe"]="https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/$series/snapshot/Ubuntu-hwe-$kernel.tar.gz"
done

The output from that highly grotesque bit of bash is:

$ for k in "${!URL_MAP[@]}"; do echo "$k: ${URL_MAP[$k]}"; done | sort -Vur
5.4.0-33.37-ubuntu-focal: https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/focal/snapshot/Ubuntu-5.4.0-33.37.tar.gz
5.4-5.4.0-31.35_18.04.2-ubuntu-bionic-hwe: https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/bionic/snapshot/Ubuntu-hwe-5.4-5.4.0-31.35_18.04.2.tar.gz
5.3.0-55.49-ubuntu-eoan: https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/eoan/snapshot/Ubuntu-5.3.0-55.49.tar.gz
4.15.0-102.103_16.04.1-ubuntu-xenial-hwe: https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/xenial/snapshot/Ubuntu-hwe-4.15.0-102.103_16.04.1.tar.gz
4.15.0-102.103-ubuntu-bionic: https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/bionic/snapshot/Ubuntu-4.15.0-102.103.tar.gz
4.4.0-1033.40-ubuntu-xenial: https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/xenial/snapshot/Ubuntu-4.4.0-1033.40.tar.gz
3.13.0-169.219-ubuntu-trusty: https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/trusty/snapshot/Ubuntu-3.13.0-169.219.tar.gz

In coming up with this without your input there are several downsides,
due in part to my own ignorance about how your kernels are organized:

- Are these actually the kernels you want me to develop against? I
  suspect there's a better list from elsewhere, but I don't know how to
  find that.

- Downloading dynamically generated tarballs from cgit seems suboptimal
  for your server, since it has to gzip on the fly. I would very much
  understand if you preferred me to use a different tarball source.

- I have to detect UTS_UBUNTU_RELEASE_ABI in rules.d and fish it out, to
  detect Ubuntu kernels. It'd be better if the tarball contained the
  actual source that you're compiling.

As well, in developing against these kernels, I'll be making snapshot
releases of the packages at the usual regular intervals when all of
these are green. Since I only support one Ubuntu release kernel at a
time, this means I might break older kernels. For example, I might make
a fix for 5.4.0-33.37-focal that breaks 5.4.0-32.36-focal. That's fine
by me and expected, but it does mean that if I'm developing against the
latest and greatest, you'll want to coordinate when you SRU the new dkms
packages. This seems like it won't be a big deal anyhow with the
prebuilt wireguard.ko, but it is an important detail to keep in mind.
And of course, if you want me to develop against a different set of
kernels, I'm more than happy to scrap my gross cgit tag scraping and use
something different that you prefer.

Preliminary usage of this CI has enabled me to adjust the compat layer
for your upcoming 18.04 kernel (and 16.04-hwe) [3]. So already that's a
nice win for the new CI: squashing bugs before they happen in the wild.

However, you'll see on the build-status page [1] that (as of writing),
compilation fails for 5.4.0-33.37, 5.4-5.4.0-31.35_18.04.2, and
3.13.0-169.219, for reasons other than wireguard. I think I see what's
wrong with those kernel trees and could send patches to fix them, but
I'm not sure that'd be appropriate: ultimately non-wireguard fixes to
your commercially supported kernels are your responsibility. (Plus the
last time I sent a patch to fix your 3.13 kernel, it was ignored for a
few weeks before finally being nack'd because that's only a kernel for
paid customers or something confusing like that [2]). So I'll leave it
to you to fix these and get the CI all green again. But the fact that
some of these kernels do have unrelated breakage reinforces my original
question in this email: am I developing and testing against the right
set of kernels? Those build failures make me suspect I've done something
wrong in my kernel selection algorithm above.

So, let me know what you'd like to do here. I think the work I've done
here should give us a pretty easy basis on which to proceed. But I will
need a bit of input on what kernels I should actually be focusing on, so
that this is actually a productive use of development time.

Thanks,
Jason

PS: Your 4.4 kernel is missing [4], which prohibits it from compiling on
gcc≥7. This makes diagnostics from newer compilers impossible and
complicates the build system a bit. Greg backported this to 4.4.57 in
2017, so it should be pretty easy for you guys to cherry pick.

[1] https://www.wireguard.com/build-status/
[2] https://lists.ubuntu.com/archives/kernel-team/2020-May/109542.html
[3] https://git.zx2c4.com/wireguard-linux-compat/commit/?id=997bef04a20533aadab3a4dd13d05e58191102bd
[4] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-4.4.y&id=4cb0c0b73d1c79a8ce260836b3f27650aa1c57f1
