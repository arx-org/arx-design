# AEP 1 - Arx Implementation Proposal Template

* **Author** ...
* **Status**: Approved <!-- Approved, Draft, Active, Denied -->
* **Type**: Informational <!-- Standards Track | Informational | Process -->
* **Created**: 2021-01-27
* **Resolution**: None

## Abstract

AEP are a formal process whereby important changes are proposed and
discussed. Corresponding to each AEP is a document that outlines the
proposed change(s), the discussion around those changes, and motivation for
that change. This document outlines the details of the AEP process and
corresponding documents.

## What is an AEP?

AEP stands for "Arx Enhancement Proposal". AEPs represent a formal
process whereby important changes are proposed and discussed in the Arx
community. Corresponding to each AEP is an AEP document which outlines
the proposal and corresponding discussion. AEPs are based on
[PEP](https://www.python.org/dev/peps/) process used by the Python language
community to propose changes to the Python language. It also takes motivations
from other similar processes in communities adjacent to Arx, such as the
[NEP](https://numpy.org/neps/nep-0000.html) process for NumPy and the
[MEP](https://matplotlib.org/devel/MEP/index.html) process for Matplotlib.
However, the AEP process differs from these processes in many ways, so
those who may already be familiar with similar processes from other
communities should read this document to understand how it works for AEPs.

In particular, AEPs are significantly less formal than Python PEPs.

## Types

There are three kinds of AEPs:

A **Standards Track** AEP describes a new feature or important change for
Arx.

An **Informational** AEP describes a Arx design issue, or provides general
guidelines or information to the Python community, but does not propose a new
feature. Informational AEPs do not necessarily represent a Arx community
consensus or recommendation, so users and implementers are free to ignore
Informational AEPs or follow their advice.

A **Process** AEP describes a process surrounding Arx, or proposes a
change to (or an event in) a process. Process AEPs are like Standards Track
AEPs but apply to areas other than the Arx library itself. They may
propose an implementation, but not to Arx’s codebase; they require community
consensus. Examples include procedures, guidelines, changes to the
decision-making process, and changes to the tools or environment used in Arx
development. Any meta-AEP is also considered a Process AEP.

## Purpose

The AEP process and corresponding documents serve several purposes:

- To decide, as a community, whether a proposed change should be made.
- To decide on the process by which a change will be implemented, for example,
  whether the change should be implemented in several stages, whether
  intermediate releases are required for things like deprecations, and so on.
- To document the above discussions and decisions for future reference.
- To document the motivations for a change from the perspective of end users
  who may be affected by it. Here "end users" means both users of the Arx
  library, as well as developers working on parts of Arx itself which may be
  affected by the change.

Importantly, **an AEP is not documentation** for the proposed change. End
user documentation should be included with the implementation of the feature
in the corresponding Arx documentation. This also means that other
documentation should not cross-reference an AEP as if it were documentation
for a feature. Even technical discussion of a feature should be documented
separately from an AEP. The reason is that AEPs will necessarily include
details that are irrelevant to the final implementation, such as discussions
of alternate implementations which were rejected and discussions of
implementation of the change.

## AEP Workflow

Discussions around a proposed change may begin informally on the mailing list
or Arx issue tracker. However, once it is decided that the formal AEP
process is desired for a change, the discussion should move to the
[AEP repository](https://github.com/arx-org/arx-design) on GitHub.

Every AEP must have a champion. This is a person who is responsible for
writing the AEP, leads the discussion around it, and tries to create
consensus around it.

The author of an AEP should fork the repository and create a pull request
with a new AEP document based on the [AEP template](AEP-template).
The AEP document may be named `AEP-YYYY-XX.md` until a number is assigned.
One of the core Arx developers will then assign a number to the AEP, in
which case `XXXX` should be replaced with the number with leading 0s. The
person who assigns the number should also update the
[README](https://github.com/arx-org/arx-design/blob/main/README.md) of the main
[AEP repository](https://github.com/arx-org/arx-design) to list that number.
Numbers should be assigned to AEPs as soon as it is determined that they
are a legitimate proposal. If an AEP ends up being rejected or postponed, it
keeps its number, as rejection or postponement status is still a discussion
that should be documented in the AEP. AEP numbers should generally be
assigned in increasing numeric order.

Discussion on the AEP should then continue on the AEP pull request.
Discussions may also take place in other places, such as [GitHub
discussions](https://github.com/arx-org/arx-design/discussions) or the [mailing
list](http://groups.google.com/group/Arx). All discussions should be
cross-referenced in the "Discussions" section of the AEP document.

For each AEP, the community should decide whether a draft implementation is
needed before acceptance or not. For instance, if an AEP concerns the
details of how a feature is implemented, it should be accepted before that
happens. On the other hand, the community may decide that it cannot come to a
consensus about an AEP until a draft implementation is proposed.

Once the community reaches a consensus about an AEP, the status of an AEP
should be updated (see below). This consensus may be to accept or to reject
the AEP, or to defer it. Here the "community" refers to the broader
community that has a stake in the AEP, not just the core Arx developers.
The purpose of the AEP process is not to create a cabal of decision makers,
but rather to enhance the involvement of the broader Arx community in the
decision making process.

### Status

The **status** section at the top of the AEP document (see the
[template](AEP-template)) should be updated according to the current status
of the AEP.

All AEPs should be created with the **Draft** status. **Draft** status
AEPs generally live in a pull request.

Eventually, after discussion, there may be a consensus that the AEP should
be accepted–see the next section for details. At this point the status
becomes **Accepted**.

Once an AEP has been **Accepted**, the reference implementation must be
completed. When the reference implementation is complete and incorporated into
the main source code repository, the status will be changed to **Final**.

A AEP can also be assigned status **Deferred**. The AEP author or a core
developer can assign the AEP this status when no progress is being made on
the AEP.

A AEP can also be **Rejected**. Perhaps after all is said and done it was
not a good idea. It is still important to have a record of this fact. The
**Withdrawn** status is similar—it means that the AEP author themselves has
decided that the AEP is actually a bad idea, or has accepted that a
competing proposal is a better alternative.

AEPs can also be **Superseded** by a different AEP, rendering the
original obsolete.

Process AEPs may also have a status of **Active** if they are never meant
to be completed, e.g. AEP 1 (this AEP).

### Merging the AEP Document Pull Request

Whenever an AEP moves from the **Draft** status to one of the other above
statuses, the header should be updated, and the corresponding pull request
should be merged. This way the document lives inside of the AEP repository
proper. AEPs that are merged are not set in stone, and may be updated by
future pull requests (although AEPs that are **Accepted** should generally
not be significantly modified once they have reached that status). The purpose
of merging is simply to make the AEP visible in the repository, even if it
isn't yet accepted or rejected. AEP discussions that have stalled should
also be merged, so that the AEP becomes visible in the AEP repository
proper—again, discussion may be picked up again with a new pull request.

## Accepting an AEP

Once an AEP is Accepted by consensus of all interested contributors, an
topic should be created to the
[Arx GitHub Discussions](https://github.com/arx-org/arx/discussions)
with a subject like:

    Proposal to accept AEP #<number>: <title>

In the body of your message, you should:

- link to the latest version of the AEP,

- briefly describe any major points of contention and how they were resolved,

- include a sentence like: “If there are no substantive objections within 7
  days from this message, then the AEP will be accepted; see AEP 1 for
  more details.”

After you start this discussion, add the GitHub discussion link
to the Discussion section of the AEP, so that people can find it later.

Generally, the AEP author will be the one to start this GH Discussion,
but anyone can do it – the important thing is to make sure that everyone
knows when an AEP is on the verge of acceptance, and give them a final
chance to respond. If there’s some special reason to extend this final
comment period beyond 7 days, then that’s fine, just say so in the GH Discussion.
It shouldn’t be less than 7 days, because sometimes people are traveling
or similar and need some time to respond.

In general, the goal is to make sure that the community has consensus, not
provide a rigid policy for people to try to game. When in doubt, err on the
side of asking for more feedback and looking for opportunities to compromise.

If the final comment period passes without any substantive objections, then
the AEP can officially be marked **Accepted**. A followup message should then
be sent to its GH Discussion thread. Update the AEP by setting its **Status** to
**Accepted**, and its **Resolution** header to a link to your GH Discussion thread.
The AEP pull request should be merged at this time, if it hasn't been
already, so that it is visible in the AEP repository proper.

If there are substantive objections, then the AEP remains in Draft state,
discussion continues as normal, and it can be proposed for acceptance again
later once the objections are resolved.

## Discussion

- None

## License

BSD-3-Clause


## Acknowledge

This Implementation Proposal Template was based on
[Arx Enhancement Proposal](https://github.com/arx-org/arx-design/blob/68f05463c1f71c06b3c210b4cab552ba4bcda836/AEP-0001.md)
