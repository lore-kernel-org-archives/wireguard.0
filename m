Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC8EC46CD3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Dec 2023 04:58:53 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7fc188bc;
	Wed, 20 Dec 2023 04:58:53 +0000 (UTC)
Received: from dd47522.kasserver.com (dd47522.kasserver.com [85.13.163.247])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1fed30dc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Jun 2023 14:25:02 +0000 (UTC)
Received: from dd47522.kasserver.com (dd0805.kasserver.com [85.13.161.253])
 by dd47522.kasserver.com (Postfix) with ESMTPSA id 40285DF40078
 for <wireguard@lists.zx2c4.com>; Fri,  9 Jun 2023 16:25:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=helweg.eu;
 s=kas202303181126; t=1686320702;
 bh=OFUAhwbjbgeLp+K8EfrFETz3OLROvHXezCaGgi86V1g=;
 h=Subject:To:From:Reply-To:Date:From;
 b=aYSztPBq26tSD/gomtqUX3GRXOomeZP5dz3bc6/pjWHmly8PC2i4CngoX7lDQ9+hV
 zPWnM+xSCPcp+9VO8vPNKKnIBCqz/q9IdlJ672ERUoYYIAixQjI2pnz2Locifa1d3w
 cnMbgsf8CRDvtnTqaxrQsK2HXpSMivs0pT4HTL4PsJjCXZj4FOCYDVh2z8+eV3O6gJ
 CD/ppYEPy4pkNpE/SyEO//29fJ2eyawBUuVQXsQb7PTZwY0e8WL65wQoTEgUbbz8B8
 c674XSDTHgaXyZiaQ3hf8Z9DO8lta+FG90c+LR/0ErniOGZGrp9Desu/WeilF6Xx11
 ooHdSuscugpxw==
Subject: Updating swift tools version to 5.5?
To: wireguard@lists.zx2c4.com
From: news@helweg.eu
User-Agent: ALL-INKL Webmail 2.11
X-SenderIP: 95.91.245.120
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Message-Id: <20230609142502.40285DF40078@dd47522.kasserver.com>
Date: Fri,  9 Jun 2023 16:25:02 +0200 (CEST)
X-Spamd-Bar: /
X-Mailman-Approved-At: Wed, 20 Dec 2023 04:58:44 +0000
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
Reply-To: wireguard@helweg.eu
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi,=20

I'm trying to implement the Wireguard iOS Kit into my own iOS App. I follow=
ed the description in the README.md of the wireguard-apple repo.

When I try to add the Swift-Package "https://git.zx2c4.com/wireguard-apple"=
 xCode complains with:=20

Invalid manifest (compiled with: ["/Applications/Xcode.app/Contents/Develop=
er/Toolchains/XcodeDefault.xctoolchain/usr/bin/swiftc", "-vfsoverlay", "/va=
r/folders/l6/dvt5060j6qlb9_cr_551vdpw0000gn/T/TemporaryDirectory.41wnnP/vfs=
=2Eyaml", "-L", "/Applications/Xcode.app/Contents/PlugIns/IDESwiftPackageCo=
re.framework/Versions/A/Frameworks/SwiftPM.framework/SharedSupport/Manifest=
API", "-lPackageDescription", "-Xlinker", "-rpath", "-Xlinker", "/Applicati=
ons/Xcode.app/Contents/PlugIns/IDESwiftPackageCore.framework/Versions/A/Fra=
meworks/SwiftPM.framework/SharedSupport/ManifestAPI", "-target", "arm64-app=
le-macos12.0", "-sdk", "/Applications/Xcode.app/Contents/Developer/Platform=
s/MacOSX.platform/Developer/SDKs/MacOSX13.3.sdk", "-swift-version", "5", "-=
I", "/Applications/Xcode.app/Contents/PlugIns/IDESwiftPackageCore.framework=
/Versions/A/Frameworks/SwiftPM.framework/SharedSupport/ManifestAPI", "-sdk"=
, "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Dev=
eloper/SDKs/MacOSX13.3.sdk", "-package-description-version", "5.3.0", "-Xfr=
ontend", "-serialize-diagnostics-path", "-Xfrontend", "/Users/jens/Library/=
Caches/org.swift.swiftpm/manifests/ManifestLoading/wireguard-apple.dia", "/=
Package.swift", "-disallow-use-new-driver", "-o", "/var/folders/l6/dvt5060j=
6qlb9_cr_551vdpw0000gn/T/TemporaryDirectory.mYqMCN/wireguard-apple-manifest=
"])

I can see that the iOS and macOS versions have been bumped to v12 and v15 i=
n one of the last commits.=20

Shouldn't the swift tools version also be updated to 5.5?  (First line in t=
he Package.swift file).

Best, Jens
